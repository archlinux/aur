# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=htscodecs
pkgver=0.5
_pkgver=${pkgver//./-}
pkgrel=1
pkgdesc="Custom compression for sequencing formats, e.g. CRAM"
arch=('i686' 'x86_64')
url="https://github.com/jkbonfield/htscodecs"
license=('BSD')
depends=('bzip2' 'zlib')
source=($pkgname-$pkgver.tar.gz::https://github.com/jkbonfield/htscodecs/archive/v$pkgver.tar.gz)
sha256sums=('bac6883e37b474ad8ce04d61204f513301eb884aaaf5f4e6d69c4e9fb3368328')

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
