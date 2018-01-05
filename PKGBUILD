# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Mark Rosenstand <mark@borkware.net>

pkgname=bwbar
pkgver=1.2.3
pkgrel=4
arch=(x86_64)
pkgdesc="Generates text and graphical readout of the current bandwidth usage."
url="http://www.kernel.org/pub/software/web/bwbar/"
license=("GPL")
depends=('libpng')
#source=(http://www.kernel.org/pub/software/web/$pkgname/$pkgname-$pkgver.tar.gz)
source=(https://arch.p5n.pp.ru/~sergej/dl/2011/$pkgname-$pkgver.tar.gz)
sha256sums=('bd8f5079f17b1dec6eae81ddc43c58c49b777b336fd902ffbb8e631885fbb45c')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  sed -i '1,1i#include <zlib.h>' bwbar.c
  sed -i 's|png_ptr->jmpbuf|png_jmpbuf(png_ptr)|' bwbar.c
  ./configure
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  install -D -m755 bwbar "$pkgdir"/usr/bin/bwbar
}
