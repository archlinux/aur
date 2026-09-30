# Maintainer:
# Contributor: fsyy <fossy2001 @ web.de>

_pkgname="python-elgato-streamdeck"
pkgname="$_pkgname"
pkgver=0.10.0
pkgrel=1
pkgdesc="Library to control Elgato Stream Deck devices"
url="https://github.com/abcminiuser/python-elgato-streamdeck"
license=('MIT')
arch=('any')

depends=(
  'python'
  'python-pillow'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

_pkgsrc="$_pkgname-${pkgver}"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/${pkgver%%.r*}.$_pkgext")
sha256sums=('8e16bd7d35931f8e231e6d850035b240233be8f785edebea0bd5bf1ad03130ba')

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
