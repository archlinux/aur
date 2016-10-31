pkgname=cockatrice-git
pkgver=20161030
pkgrel=1
pkgdesc='Open-source multiplatform supported program for playing tabletop card games over a network.'
arch=('i686' 'x86_64')
url='https://github.com/Cockatrice/Cockatrice'
license=('GPL2')
depends=('protobuf' 'qt5-svg' 'qt5-tools' 'qt5-multimedia')
makedepends=('cmake' 'git')
_pkgver="${pkgver:0:4}-${pkgver:4:2}-${pkgver:6:2}"
source=("git+https://github.com/Cockatrice/Cockatrice#tag=$_pkgver-Release")
sha256sums=('SKIP')

build() {
  cd "$srcdir/Cockatrice"
  test -d build && rm -rf build
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DWITH_CLIENT=1 -DWITH_ORACLE=1 -DWITH_SERVER=0 ..
  make
}

package() {
  cd "$srcdir/Cockatrice/build"
  make DESTDIR="$pkgdir/" install
}