# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=libkeccak
pkgver=1.1.4
pkgrel=1
pkgdesc="Keccak-family hashing library"
arch=(i686 x86_64)
url="https://github.com/maandree/libkeccak"
license=('custom:ISC')
depends=(glibc)
checkdepends=(glibc valgrind make coreutils)
makedepends=(glibc gcc make coreutils binutils)
source=(libkeccak-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(40e27983ea63faf47071402b212da48101b1dae37ce2702da947361ee8d4a313)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make CONFIGFILE=optimised.mk PREFIX=/usr
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make CONFIGFILE=optimised.mk check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make CONFIGFILE=optimised.mk PREFIX=/usr DESTDIR="$pkgdir" install
}
