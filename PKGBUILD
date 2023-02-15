# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=htscodecs
pkgver=1.4.0
_pkgver=${pkgver//./-}
pkgrel=1
pkgdesc="Custom compression for sequencing formats, e.g. CRAM"
arch=('i686' 'x86_64')
url=https://github.com/samtools/htscodecs
license=('BSD')
depends=('bzip2' 'zlib')
source=($pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/htscodecs-$pkgver.tar.gz)
sha256sums=('e47508d4db2177880cb0df46ac327f88eebd6671f54787b1a18a1c0feb415d2d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  aclocal
  autoreconf --install
  ./configure --prefix=/usr
  make CFLAGS=-g
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
