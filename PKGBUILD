# Maintainer:
# Contributor: fsyy <fossy2001 @ web.de>

_pkgname="python-elgato-streamdeck"
pkgname="$_pkgname"
pkgver=0.9.5
pkgrel=1
pkgdesc="Library to control Elgato Stream Deck devices"
url="https://github.com/abcminiuser/python-elgato-streamdeck"
license=('MIT')
arch=('any')

depends=(
  'python-pillow'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

_pkgsrc="$_pkgname-${pkgver%%.r*}"
_pkgext="tar.gz"
source=(
  "$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/${pkgver%%.r*}.$_pkgext"
)
sha256sums=(
  '1aa458a9f718b3a62acc1cc0434fd5a41333bea1c7a318426132fdecc7603d19'
)

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
