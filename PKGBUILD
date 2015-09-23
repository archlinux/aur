# Maintainer: Jorge Araya Navarro <elcorreo@deshackra.com>
pkgname=cockatrice-client
pkgver=20150809.2
pkgrel=9
pkgdesc="A cross-platform virtual tabletop for multiplayer card games (Client)"
arch=('i686' 'x86_64')
url="http://www.woogerworks.com/"
license=('GPL2')
depends=('qt5-base' 'qt5-tools' 'qt5-multimedia' 'qt5-svg' 'protobuf' 'zlib')
makedepends=('cmake')
provides=('cockatrice-client')
conflicts=('cockatrice-client')
source=(https://github.com/Cockatrice/Cockatrice/archive/2015-08-09-Release.tar.gz)
md5sums=('3ce7bcee80dcb0f1bdb205eff2b9146e')

build() {
  cd "$srcdir/Cockatrice-2015-08-09-Release"

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
  cd "$srcdir/Cockatrice-2015-08-09-Release/build"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
