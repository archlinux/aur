# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libdeflate
pkgver=1.4
pkgrel=1
pkgdesc="Heavily optimized library for DEFLATE/zlib/gzip compression and decompression"
arch=('i686' 'x86_64')
url="https://github.com/ebiggers/libdeflate"
license=('MIT')
depends=('glibc')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/ebiggers/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('312b5c6abbc87c4d274b61c1cb47059765066c6c7abcd6ba1e60141274e09bf0')


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
