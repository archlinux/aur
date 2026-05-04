# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=libsha1
pkgver=1.1.5.1
pkgrel=1
pkgdesc="SHA-1 and SHA-0 hashing library"
arch=(i686 x86_64 aarch64)
url="https://codeberg.org/maandree/libsha1"
license=('custom:ISC')
depends=()
checkdepends=()
makedepends=()
source=(libsha1-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(8ad304dade348ca223602ba32f8d6df3ba1efc657ce7a936e948969cfb8b6450)

_config=config-portable.mk
if test "$(uname -m)" = x86_64; then
  _config=config-x86.mk
elif test "$(uname -m)" = aarch64; then
  _config=config-armv8.mk
fi

build() {
  cd "$srcdir/$pkgname"
  make CONFIGFILE="${_config}" PREFIX=/usr
}

check() {
  cd "$srcdir/$pkgname"
  make CONFIGFILE="${_config}" check
}

package() {
  cd "$srcdir/$pkgname"
  make CONFIGFILE="${_config}" PREFIX=/usr DESTDIR="$pkgdir" install
}
