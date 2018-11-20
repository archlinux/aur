# Contributor: Auguste Pop <auguste [at] gmail [dot] com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=fuego-svn
pkgver=2033
pkgrel=2
pkgdesc="A collection of C++ libraries for the game of Go"
arch=('i686' 'x86_64')
url="http://fuego.sourceforge.net/"
license=('GPL')
depends=('boost-libs')
makedepends=('boost')
source=("fuego-code::svn+https://svn.code.sf.net/p/fuego/code/trunk/")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-svn}-code
  local ver="$(svnversion)"
  printf "%s" "${ver//[[:alpha:]]}"
}

build() {
  cd ${pkgname%-svn}-code
  autoreconf -i
  CXXFLAGS="-march=native -O3 -pipe -DBOOST_FILESYSTEM_VERSION=3" \
          LIBS="-lpthread" ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname%-svn}-code
  make DESTDIR="$pkgdir" install
}
