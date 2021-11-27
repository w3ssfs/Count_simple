import "package:flutter/material.dart";


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void decrement() {
    setState(() {
      count--;
    });
  }

  void increment() {
    setState(() {
      count++;
    });
  }

  bool get isEmpty => count == 0;

  bool get isFull => count == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/fundo.jpg'),
                fit: BoxFit.cover)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isFull ? 'Lotado!' : 'Pode entrar!',
                style:   TextStyle(
                  fontSize: 40,
                  color:  Colors.white,
                  fontWeight: isFull ? FontWeight.w900 : FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Text('$count',
                    style:  TextStyle(
                        fontSize: 80,
                        color: isFull ? Colors.red : Colors.white,
                        fontWeight: isFull ? FontWeight.w900 : FontWeight.w600)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: isEmpty ? Colors.white.withOpacity(
                              0.2) : Colors.white,
                          fixedSize: const Size(120, 100),
                          primary: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      onPressed: isEmpty ? null : decrement,
                      child: const Text(
                        'Saiu',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      )),
                  const SizedBox(
                    width: 40,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: isFull ? Colors.white.withOpacity(
                              0.2) : Colors.white,
                          fixedSize: const Size(120, 100),
                          primary: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      onPressed: isFull ? null : increment,
                      child: const Text(
                        'Entrou',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
