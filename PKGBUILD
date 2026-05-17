# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=libsha1
pkgver=1.1.6
pkgrel=1
pkgdesc="SHA-1 and SHA-0 hashing library"
arch=(i686 x86_64 aarch64)
url="https://codeberg.org/maandree/libsha1"
license=('custom:ISC')
depends=()
checkdepends=()
makedepends=()
source=(libsha1-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(2be2347a81dc607688758f420494375dc68be220cf03fba674d76c8042567a93)

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
