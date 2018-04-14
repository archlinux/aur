# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libdeflate
pkgver=1.0
pkgrel=1
pkgdesc="Heavily optimized library for DEFLATE/zlib/gzip compression and decompression"
arch=('i686' 'x86_64')
url="https://github.com/ebiggers/libdeflate"
license=('MIT')
depends=('glibc')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/ebiggers/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('6477a42d59b8c3fedda9d09b25e7ddfb71524c0029553c2a030e9d6887618a59')


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

  install -Dm755 "gzip" "$pkgdir/usr/bin/libdeflate-gzip"
  ln -s "/usr/bin/libdeflate-gzip" "$pkgdir/usr/bin/libdeflate-gunzip"

  install -Dm755 "libdeflate.so" "$pkgdir/usr/lib/libdeflate.so"
  install -Dm644 "libdeflate.h" "$pkgdir/usr/include/libdeflate.h"
  install -Dm644 "libdeflate.a" "$pkgdir/usr/lib/libdeflate.a"

  install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
