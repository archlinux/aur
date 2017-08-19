# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libdeflate
pkgver=0.8
pkgrel=1
pkgdesc="Heavily optimized library for DEFLATE/zlib/gzip compression and decompression"
arch=('i686' 'x86_64')
url="https://github.com/ebiggers/libdeflate"
license=('MIT')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/ebiggers/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('4b27e55226db9f47a53bc51df732c9d4aba674cf64594f9c4e253e6dae4f3688')


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
  ln -s "$pkgdir/usr/bin/libdeflate-gzip" "$pkgdir/usr/bin/libdeflate-gunzip"

  install -Dm755 "libdeflate.so" "$pkgdir/usr/lib/libdeflate.so"
  install -Dm644 "libdeflate.h" "$pkgdir/usr/include/libdeflate.h"
  install -Dm644 "libdeflate.a" "$pkgdir/usr/lib/libdeflate.a"

  install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
