# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=htscodecs
pkgver=1.6.0
_pkgver=${pkgver//./-}
pkgrel=1
pkgdesc="Custom compression for sequencing formats, e.g. CRAM"
arch=('i686' 'x86_64')
url=https://github.com/samtools/htscodecs
license=('BSD')
depends=('bzip2' 'zlib')
source=($pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/htscodecs-$pkgver.tar.gz)
sha256sums=('4b4abb6dfa192f179386c1d49256892a134297ecb4dd25ad4c346e9dde1108c0')

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
