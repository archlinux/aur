# Maintainer:
# Contributor: Denis Kasak <dkasak|AT|termina.org.uk>
# Contributor: xsmile <sascha_r gmx de>

_pkgname="ta-lib"
pkgname="$_pkgname"
pkgver=0.7.1
pkgrel=1
pkgdesc="A library providing common functions for the technical analysis of financial market data"
url="https://github.com/TA-Lib/ta-lib"
license=('BSD-3-Clause')
arch=('x86_64' 'i686')

depends=('glibc')

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/v$pkgver.$_pkgext")
sha256sums=('40e7a6978052fe5245771e430e6a4c4553b40038f8ac5a985a1540c4c1fa6ace')

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
