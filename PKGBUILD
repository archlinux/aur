# Maintainer:
# Contributor: fsyy <fossy2001 @ web.de>

_pkgname="python-elgato-streamdeck"
pkgname="$_pkgname"
pkgver=0.9.4
pkgrel=2
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
  '86ed641bb665dd27d064651775f2523e83df253659e937e72b2c2012b667fa6a'
)

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="${pkgdir:?}" dist/*.whl

  install -Dm644 LICENSE -t "${pkgdir:?}/usr/share/licenses/${pkgname:?}/"
}
