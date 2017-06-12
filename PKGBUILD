# Maintainer: Scott Linder <scott.linder18@gmail.com>
# Contributer: Mikhail Burakov <mikhail.burakov@gmail.com>

pkgname=cockatrice-git
pkgver=2.3.17
_reldate=2017-05-05
pkgrel=1
pkgdesc='Open-source multiplatform supported program for playing tabletop card games over a network.'
arch=('i686' 'x86_64')
url='https://github.com/Cockatrice/Cockatrice'
license=('GPL2')
depends=('protobuf' 'qt5-svg' 'qt5-tools' 'qt5-multimedia')
makedepends=('cmake')
_relname="$_reldate-Release-$pkgver"
source=("https://github.com/Cockatrice/Cockatrice/archive/$_relname.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/Cockatrice-$_relname"
  test -d build && rm -rf build
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DWITH_CLIENT=1 -DWITH_ORACLE=1 -DWITH_SERVER=0 ..
  make
}

package() {
  cd "$srcdir/Cockatrice-$_relname/build"
  make DESTDIR="$pkgdir/" install
}
