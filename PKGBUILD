# Maintainer:
# Contributor: Denis Kasak <dkasak|AT|termina.org.uk>
# Contributor: xsmile <sascha_r gmx de>

## links
# http://ta-lib.org
# https://github.com/TA-Lib/ta-lib

_pkgname="ta-lib"
pkgname="$_pkgname"
pkgver=0.6.3
pkgrel=1
pkgdesc="A library providing common functions for the technical analysis of financial market data"
url="https://github.com/TA-Lib/ta-lib"
license=('BSD-3-Clause')
arch=('x86_64' 'i686')

depends=('glibc')

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=(
  "$_pkgsrc.$_pkgext"::"https://github.com/TA-Lib/ta-lib/archive/refs/tags/v$pkgver.$_pkgext"
)
sha256sums=(
  '50114d27c1031069d11915178a44dd2fde14d235233c0f78d6e61cd7bc3bbfa7'
)

build() {
  cd "$_pkgsrc"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "$_pkgsrc"
  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
