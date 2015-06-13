# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Kovivchak Evgen <oneonfire@gmail.com>

pkgname=codec2-svn
pkgver=2027
pkgrel=1
pkgdesc="Open source 2400 bit/s speech codec"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://codec2.org/"
depends=('glibc')
makedepends=('subversion' 'cmake')
source=('svn+https://freetel.svn.sourceforge.net/svnroot/freetel/codec2')
md5sums=('SKIP')
_svnmod=codec2

pkgver() {
  cd "$_svnmod"
  local ver="$(svnversion)"
  printf "%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$_svnmod"
  mkdir -p build_linux
  cd build_linux
  cmake ../ -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR:PATH=lib
  make 
}

package() {
  cd "$_svnmod"
  install -m644 -D COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  cd "build_linux"
  make DESTDIR="$pkgdir" install
}
