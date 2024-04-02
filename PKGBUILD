# Maintainer: Tong Chunli (tty2099@gmail.com) 

pkgname=amqp-cpp
_pkgnm=AMQP-CPP
pkgver=4.3.26
pkgrel=1
pkgdesc="AMQP-CPP is a C++ library for communicating with a RabbitMQ message broker."
arch=('any')
url="https://github.com/CopernicaMarketingSoftware/AMQP-CPP"
license=('Apache2.0')
depends=()
makedepends=('cmake')
source=(https://github.com/CopernicaMarketingSoftware/AMQP-CPP/archive/v$pkgver.tar.gz)
sha256sums=('2baaab702f3fd9cce40563dc1e23f433cceee7ec3553bd529a98b1d3d7f7911c')

prepare(){
    sed -i 'N;22 i #include<string>' $srcdir/AMQP-CPP-4.3.26/src/linux_tcp/sslerrorprinter.h 
}

package(){
  cd "$srcdir"
  rm -rf build
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DAMQP-CPP_BUILD_SHARED=on -DAMQP-CPP_LINUX_TCP=on ../$_pkgnm-$pkgver    
  make
  make DESTDIR=$pkgdir install
}

