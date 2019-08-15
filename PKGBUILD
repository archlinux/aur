# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libdeflate
pkgver=1.3
pkgrel=1
pkgdesc="Heavily optimized library for DEFLATE/zlib/gzip compression and decompression"
arch=('i686' 'x86_64')
url="https://github.com/ebiggers/libdeflate"
license=('MIT')
depends=('glibc')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/ebiggers/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('09a23f5a6bf74789605a452364fae2156627a0a62a3de2a82ceb362982a87f0b')


build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  make test_programs
  ./test_checksums
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
