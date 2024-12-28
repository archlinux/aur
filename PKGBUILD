# Maintainer:
# Contributor: Denis Kasak <dkasak|AT|termina.org.uk>
# Contributor: xsmile <sascha_r gmx de>

_pkgname="ta-lib"
pkgname="$_pkgname"
pkgver=0.6.2
pkgrel=1
pkgdesc="A library providing common functions for the technical analysis of financial market data"
#url="http://ta-lib.org"
url="https://github.com/TA-Lib/ta-lib"
license=('BSD-3-Clause')
arch=('x86_64' 'i686')

depends=('glibc')

_pkgsrc="$_pkgname-${pkgver%%.r*}"
_pkgext="tar.gz"
source=(
  "$_pkgsrc.$_pkgext"::"https://github.com/TA-Lib/ta-lib/archive/refs/tags/v${pkgver%%.r**}.$_pkgext"
)
sha256sums=(
  '6b7c5e575bd3359d46b7103d11637a5d689b9efeae88103d145987a0e7f83316'
)

build() {
  cd "$_pkgsrc"

  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "$_pkgsrc"
  make DESTDIR="${pkgdir:?}" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
