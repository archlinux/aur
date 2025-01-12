# Maintainer:
# Contributor: Denis Kasak <dkasak|AT|termina.org.uk>
# Contributor: xsmile <sascha_r gmx de>

## links
# http://ta-lib.org
# https://github.com/TA-Lib/ta-lib

_pkgname="ta-lib"
pkgname="$_pkgname"
pkgver=0.6.4
pkgrel=1
pkgdesc="A library providing common functions for the technical analysis of financial market data"
url="https://github.com/TA-Lib/ta-lib"
license=('BSD-3-Clause')
arch=('x86_64' 'i686')

depends=('glibc')

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/v$pkgver.$_pkgext")
sha256sums=('a2fac51f4f1d4804dd2edd1701d52bb9728a5c2ec936d0c5d9a222c49f57d77b')

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
