# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=htscodecs
pkgver=1.5.0
_pkgver=${pkgver//./-}
pkgrel=1
pkgdesc="Custom compression for sequencing formats, e.g. CRAM"
arch=('i686' 'x86_64')
url=https://github.com/samtools/htscodecs
license=('BSD')
depends=('bzip2' 'zlib')
source=($pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/htscodecs-$pkgver.tar.gz)
sha256sums=('34def7341d01a374583d61c9012a80f6b40af078b11bfcaacba1a2412e34dab3')

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
