# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=libkeccak
pkgver=1.2
pkgrel=1
pkgdesc="Keccak-family hashing library"
arch=(i686 x86_64)
url="https://github.com/maandree/libkeccak"
license=('custom:ISC')
depends=(glibc)
checkdepends=(glibc valgrind make coreutils)
makedepends=(glibc gcc make coreutils binutils)
source=(libkeccak-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(a9fa976a601b749499f24975756f98c28edddfb5e6828c681ccde7cfcb95d5f8)

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
