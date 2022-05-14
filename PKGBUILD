# Maintainer: Tong Chunli (tty2099@gmail.com) 

pkgname=amqp-cpp
_pkgnm=AMQP-CPP
pkgver=4.3.16
pkgrel=1
pkgdesc="AMQP-CPP is a C++ library for communicating with a RabbitMQ message broker."
arch=('any')
url="https://github.com/CopernicaMarketingSoftware/AMQP-CPP"
license=('Apache2.0')
depends=()
makedepends=('cmake')
source=(https://github.com/CopernicaMarketingSoftware/AMQP-CPP/archive/v$pkgver.tar.gz)
sha256sums=('66c96e0db1efec9e7ddcf7240ff59a073d68c09752bd3e94b8bc4c506441fbf7')

prepare(){
    sed -i 'N;22 i #include<string>' $srcdir/AMQP-CPP-4.3.16/src/linux_tcp/sslerrorprinter.h 
}

package(){
  cd "$srcdir"
  rm -rf build
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DAMQP-CPP_BUILD_SHARED=on -DAMQP-CPP_LINUX_TCP=on ../$_pkgnm-$pkgver    
  make
  make DESTDIR=$pkgdir install
}

