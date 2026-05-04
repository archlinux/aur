# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=libsha2
pkgver=1.1.4
pkgrel=1
pkgdesc="SHA-2-family hashing library"
arch=(i686 x86_64 aarch64)
url="https://codeberg.org/maandree/libsha2"
license=('custom:ISC')
depends=()
checkdepends=()
makedepends=()
source=(libsha2-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(1807a0afd4148012bbf882be03173db39cd12e6651d140c03aeded3456c03fb7)

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
  make CONFIGFILE="${_config}" CHECK_FLAGS=skip-huge check 
}

package() {
  cd "$srcdir/$pkgname"
  make CONFIGFILE="${_config}" PREFIX=/usr DESTDIR="$pkgdir" install
}
