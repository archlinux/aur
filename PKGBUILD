# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Kovivchak Evgen <oneonfire@gmail.com>

pkgname=codec2-svn
pkgver=2493
pkgrel=1
pkgdesc="Open source 2400 bit/s speech codec"
arch=('i686' 'x86_64')
license=('LGPL')
#url="http://www.rowetel.com/blog/?page_id=452"
url="http://codec2.org/"
depends=('glibc')
makedepends=('subversion' 'cmake')
# stable version
#source=('svn+https://freetel.svn.sourceforge.net/svnroot/freetel/codec2')
# dev version
source=('svn+https://svn.code.sf.net/p/freetel/code/codec2-dev')
md5sums=('SKIP')
#_svnmod=codec2
_svnmod=codec2-dev

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
