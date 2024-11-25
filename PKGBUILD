# Maintainer: Letu Ren <fantasquex at gmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Maikel Wever <maikelwever@gmail.com>

pkgname='python-dparse'
_name=${pkgname#python-}
pkgver=0.6.4
pkgrel=1
pkgdesc="Parser for Python dependency files"
arch=('any')
url="https://github.com/pyupio/dparse"
license=('MIT')
depends=(
  'python-packaging'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-hatchling'
)
optdepends=(
  'python-pipenv: pipenv'
  'python-pyyaml: conda'
  'python-poetry: poetry'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('b897bbf1df2cd0fb0c7d45b04e660c256cf368a1f46e34d78b41c167f877b582')

build() {
  cd ${_name}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_name}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
