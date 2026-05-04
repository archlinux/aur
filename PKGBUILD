# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=libsha2
pkgver=1.1.4.1
pkgrel=1
pkgdesc="SHA-2-family hashing library"
arch=(i686 x86_64 aarch64)
url="https://codeberg.org/maandree/libsha2"
license=('custom:ISC')
depends=()
checkdepends=()
makedepends=()
source=(libsha2-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(eee3547d9225b6a3f9d7f6243c6dede0644f9de4f900933ce23f433b0ffa96e8)

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
