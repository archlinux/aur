# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Mufeed Ali <mufeed@kumo.foo>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Federico Cassani <federico dot cassani at outlook dot com>
pkgname=python-wn
_name=${pkgname#python-}
pkgver=0.13.0
pkgrel=1
pkgdesc="Wordnet interface library"
arch=('any')
url="https://wn.readthedocs.io"
license=('MIT')
depends=(
  'python'
  'python-httpx'
  'python-tomli'
)
makedepends=(
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
  'python-pytest-benchmark'
  'python-starlette'
)
optdepends=('python-starlette')
source=("$_name-$pkgver.tar.gz::https://github.com/goodmami/wn/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9987e72445bb21404f86edbb5ecccf149871582dcf60edfd98525eac1b27ad23')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  PYTHONPATH=. pytest
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
