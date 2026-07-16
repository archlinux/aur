# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=lame-svn
pkgver=r6586
pkgrel=1
pkgdesc="A high quality MPEG Audio Layer III (MP3) encoder"
arch=('i686' 'x86_64')
url="https://lame.sourceforge.io/"
license=('LGPL-2.0-or-later')
depends=('glibc' 'mpg123' 'ncurses')
makedepends=('subversion' 'nasm')
provides=("lame=$pkgver" 'libmp3lame.so')
conflicts=('lame')
options=('staticlibs')
source=("svn+https://svn.code.sf.net/p/lame/svn/trunk")
sha256sums=('SKIP')


pkgver() {
  cd "trunk"

  _rev="$(svnversion | sed 's/[^0-9]+//')"
  printf "r%s" "$_rev"
}

build() {
  cd "trunk/lame"

  CFLAGS="$CFLAGS -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types" \
  ./configure \
    --prefix="/usr" \
    --enable-mp3rtp \
    --enable-nasm
  make
}

package() {
  cd "trunk/lame"

  make DESTDIR="$pkgdir" install
}
