# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Mufeed Ali <mufeed@kumo.foo>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Federico Cassani <federico dot cassani at outlook dot com>
pkgname=python-wn
_name=${pkgname#python-}
pkgver=1.1.0
pkgrel=2
pkgdesc="Wordnet interface library"
arch=('any')
url="https://wn.readthedocs.io"
license=('MIT')
depends=(
  'python'
  'python-httpx'
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
)
source=("$_name-$pkgver.tar.gz::https://github.com/goodmami/wn/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b5f7a9706b4cdb0cd364f1d184e381793d2d694e32fbb6cbddbb5bf4a5c67dcc')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  python -m venv --clear --without-pip --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -I -m pytest
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
