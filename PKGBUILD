# Maintainer: Jorge Araya Navarro <elcorreo@deshackra.com>
pkgname=cockatrice-client-git
pkgver=20150924.1
pkgrel=1
pkgdesc="A cross-platform virtual tabletop for multiplayer card games (Client)"
arch=('i686' 'x86_64')
url="http://www.woogerworks.com/"
license=('GPL2')
depends=('qt5-base' 'qt5-tools' 'qt5-multimedia' 'qt5-svg' 'protobuf' 'zlib')
makedepends=('git' 'cmake')
conflicts=('cockatrice-client')
source=(git+https://github.com/Cockatrice/Cockatrice.git)
md5sums=('SKIP')

build() {
  cd "$srcdir/Cockatrice"

  if [ ! -d "build"];
  then
      mkdir build
  else
    rm -rf build
    mkdir build
  fi
  cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DWITH_CLIENT=1 -DWITH_ORACLE=1 -DWITH_SERVER=0 ..
  make
}

package() {
  cd "$srcdir/Cockatrice/build"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
