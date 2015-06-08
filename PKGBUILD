# Maintainer: Andreas Schreiner <andreas.schreiner@sonnenmulde.at>

pkgname=freedv-svn
pkgver=2007
pkgrel=1
pkgdesc="Digital Voice for Radio Amateurs"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://freedv.org/"
depends=('glibc' 'portaudio' 'hamlib' 'sox' 'wxgtk' 'codec2-svn')
makedepends=('subversion' 'cmake')
source=('svn+https://freetel.svn.sourceforge.net/svnroot/freetel/fdmdv2')
md5sums=('SKIP')
_svnmod=fdmdv2

pkgver() {
  cd "$srcdir/$_svnmod"
  local ver="$(svnversion)"
  printf "%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir/$_svnmod"
  mkdir -p build_linux
  cd build_linux
  cmake ../ -DCMAKE_INSTALL_PREFIX=/usr
  make 
}

package() {
  cd "$_svnmod/build_linux"
  make DESTDIR="$pkgdir" install
  cd "$srcdir/$_svnmod"
  install -m644 -D COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
