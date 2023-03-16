import "package:flutter/material.dart";
import "../service/controller.dart";
import "package:get/get.dart";

class HomeScreen extends StatelessWidget {
  
  final CoinController control = Get.put(CoinController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: EdgeInsets.only(top: 20, right: 20, left: 20),
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Crypto Market",
                  style: TextStyle(
                      fontFamily: "CarterOne",
                      color: Colors.white,
                      fontSize: 20)),
              const SizedBox(height: 30),
              Obx(()=> control.isLoading.value ? Center(child: CircularProgressIndicator()) : ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 9,
                  itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[700],
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey[700]!,
                                            offset: Offset(2, 2),
                                           )
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.network(control.coinList[index].image),
                                    ),
                                  ),
                                  const SizedBox(width: 50),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          control.coinList[index].name,
                                          style: TextStyle(
                                              fontFamily: "Lexend",
                                              color: Colors.white,
                                              fontSize: 14),
                                        ),
                                        Text(
                                          "${control.coinList[index].priceChangePercentage24H.toStringAsFixed(2)} %",
                                          style: TextStyle(
                                              fontFamily: "Lexend",
                                              color: Colors.grey,
                                              fontSize: 14),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "${control.coinList[index].currentPrice} \$",
                                      style: TextStyle(
                                          fontFamily: "Lexend",
                                          color: Colors.green,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      control.coinList[index].symbol.toUpperCase(),
                                      style: TextStyle(
                                          fontFamily: "Lexend",
                                          color: Colors.grey,
                                          fontSize: 14,),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )) )
            ],
          ),
        ),
      ),
    );
  }
}
