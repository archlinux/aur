# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=lame-altivec
pkgver=4.0
pkgrel=1
pkgdesc="AltiVec/SSE optimized LAME encoder"
arch=('i686' 'x86_64')
url="https://tmkk.undo.jp/lame/index_e.html"
license=('LGPL-2.0-or-later')
depends=('glibc' 'mpg123' 'ncurses')
makedepends=('nasm')
provides=("lame=$pkgver" 'libmp3lame.so')
conflicts=('lame')
options=('staticlibs')
source=("https://downloads.sourceforge.net/project/lame/lame/$pkgver/lame-$pkgver.tar.gz"
        "https://tmkk.undo.jp/lame/lame-4.0-sse-20260715.diff")
sha256sums=('3df5124d5ad3a98312ffd7ba6a9b36230e4f8a3e66d3ce0f425e336c32d216eb'
            'dc4d853217b25d08360a46bd883109310ee1f6a7c08af26395fe682c471f6f56')


prepare() {
  cd "lame-$pkgver"

  patch -Np0 -i "$srcdir/lame-4.0-sse-20260715.diff"
}

build() {
  cd "lame-$pkgver"

  CFLAGS="$CFLAGS -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types" \
  ./configure \
    --prefix="/usr" \
    --enable-mp3rtp \
    --enable-nasm
  make
}

check() {
  cd "lame-$pkgver"

  #make test
}

package() {
  cd "lame-$pkgver"

  make DESTDIR="$pkgdir" install
}
