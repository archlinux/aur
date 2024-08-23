# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: damir <damir@archlinux.org>

pkgname=gocr
pkgver=0.52
pkgrel=3
pkgdesc='OCR (Optical Character Recognition) program, which converts scanned images of text back to text files'
arch=(x86_64)
url='https://www-e.uni-magdeburg.de/jschulen/ocr/'
license=(GPL-2.0-or-later)
depends=(
  glibc
  libjpeg-turbo
  netpbm
)
optdepends=(
  'fig2dev: Read xfig images'
  'tk: Tk frontend'
)
source=("https://www-e.uni-magdeburg.de/jschulen/ocr/$pkgname-$pkgver.tar.gz"{,.asc})
b2sums=(
  1f22f5377bb95053e3ab4ede074b3fceca4065f9ca0ede05a8023ebe807f41074f5ead84e133281e98be7f68f13b036dc759cccaf4a5688bf776f62f2de1970a
  SKIP
)
validpgpkeys=(3816B803D578F5AD12FDFE065D330C4953BDFBE3)

prepare() {
  cd $pkgname-$pkgver
  autoreconf -fi
}

build() {
  cd $pkgname-$pkgver
  ./configure \
    --bindir=/usr/bin \
    --mandir=/usr/share/man
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
