# Maintainer: Scott Linder <scott.linder18@gmail.com>
# Contributer: Jorge Araya Navarro <elcorreo@deshackra.com>
# Contributer: Mikhail Burakov <mikhail.burakov@gmail.com>

pkgname=cockatrice-client
pkgver=2.3.17
_reldate=2017-05-05
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
sha256sums=('95f78db3c2f4f93e2b007b92687cb1655ce5d6b23d72aeb85fc043f60748701e')

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
