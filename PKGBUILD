# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=libkeccak
pkgver=1.1.5
pkgrel=1
pkgdesc="Keccak-family hashing library"
arch=(i686 x86_64)
url="https://github.com/maandree/libkeccak"
license=('custom:ISC')
depends=(glibc)
checkdepends=(glibc valgrind make coreutils)
makedepends=(glibc gcc make coreutils binutils)
source=(libkeccak-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(bf89beb628fc2ca1d8ac97d98f07dfc789f205116037ace92fa3a5b16d513c28)

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
