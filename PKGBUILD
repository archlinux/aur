# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=htscodecs
pkgver=1.2.2
_pkgver=${pkgver//./-}
pkgrel=1
pkgdesc="Custom compression for sequencing formats, e.g. CRAM"
arch=('i686' 'x86_64')
url=https://github.com/samtools/htscodecs
license=('BSD')
depends=('bzip2' 'zlib')
source=($pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/htscodecs-$pkgver.tar.gz)
sha256sums=('d17d7a505da3fc79dcced320c132c5492b5dc78ee70d9ca8218b927070f183ca')

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
