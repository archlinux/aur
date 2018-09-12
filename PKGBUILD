# Maintainer:  Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Contributer: Scott Linder <scott.linder18@gmail.com>
# Contributer: Jorge Araya Navarro <elcorreo@deshackra.com>
# Contributer: Mikhail Burakov <mikhail.burakov@gmail.com>

pkgname=cockatrice-client
pkgver=2.6.1
_reldate=2018-07-17
pkgrel=2
pkgdesc='Open-source multiplatform supported program for playing tabletop card games over a network.'
arch=('i686' 'x86_64')
url='https://cockatrice.github.io/'
license=('GPL2')
depends=('protobuf' 'qt5-svg' 'qt5-tools' 'qt5-multimedia')
makedepends=('cmake' 'git')
provides=('cockatrice-client')
conflicts=('cockatrice-client')
_relname="$_reldate-Release-$pkgver"
source=("Cockatrice-$_relname::git+https://github.com/Cockatrice/Cockatrice.git#tag=$_relname")
sha512sums=('SKIP')

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
