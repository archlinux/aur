# Maintainer:
# Contributor: fsyy <fossy2001 @ web.de>

_pkgname="python-elgato-streamdeck"
pkgname="$_pkgname"
pkgver=0.9.8
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

_pkgsrc="$_pkgname-${pkgver%%.r*}"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/${pkgver%%.r*}.$_pkgext")
sha256sums=('cfb87341d6d940d9aa9c04728eb6c73f409f9f96e8f14c8fa90cfa40fedf6c0c')

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
