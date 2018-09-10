# Maintainer:  Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Contributer: Scott Linder <scott.linder18@gmail.com>
# Contributer: Jorge Araya Navarro <elcorreo@deshackra.com>
# Contributer: Mikhail Burakov <mikhail.burakov@gmail.com>

pkgname=cockatrice-client
pkgver=2.6.1
_reldate=2018-07-17
pkgrel=1
pkgdesc='Open-source multiplatform supported program for playing tabletop card games over a network.'
arch=('i686' 'x86_64')
url='https://cockatrice.github.io/'
license=('GPL2')
depends=('protobuf' 'qt5-svg' 'qt5-tools' 'qt5-multimedia')
makedepends=('cmake')
provides=('cockatrice-client')
conflicts=('cockatrice-client')
_relname="$_reldate-Release-$pkgver"
source=("https://github.com/Cockatrice/Cockatrice/archive/$_relname.tar.gz")
sha512sums=('4e9ed87114a3f62fe1e65342eedfdedeb6039e21e3f86a6d9d1100a89e52f78b47e9531125633ac7b0f14055a658eaee853600a3402ba7a8244d6b37ebb3888e')

build() {
  cd "$srcdir/Cockatrice-$_relname"
  test -d build && rm -rf build
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DWITH_ORACLE=1 -DWITH_CLIENT=1 -DWITH_SERVER=0 ..
  make
}

package() {
  cd "$srcdir/Cockatrice-$_relname/build"
  make DESTDIR="$pkgdir/" install
}
