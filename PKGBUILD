# Maintainer: Jorge Araya Navarro <elcorreo@deshackra.com>
pkgname=cockatrice-server
_reldate="2015-09-24"
pkgver=20150924.1
pkgrel=1
pkgdesc="A cross-platform virtual tabletop for multiplayer card games (Server)"
arch=('i686' 'x86_64')
url="http://www.woogerworks.com/"
license=('GPL2')
depends=('qt5-base' 'qt5-tools' 'protobuf')
makedepends=('cmake')
provides=('cockatrice-server')
conflicts=('cockatrice-server')
source=(https://github.com/Cockatrice/Cockatrice/archive/${_reldate}-Release.tar.gz)
md5sums=('de8004c7fea606954c0f34148dbb96da')

build() {
  cd "$srcdir/Cockatrice-${_reldate}-Release"

  if [ ! -d "build"];
  then
      mkdir build
  else
    rm -rf build
    mkdir build
  fi
  cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DWITH_SERVER=1 -DWITH_CLIENT=0 -DWITH_ORACLE=0 ..
  make
}

package() {
  cd "$srcdir/Cockatrice-${_reldate}-Release/build"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
