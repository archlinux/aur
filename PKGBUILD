# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Mufeed Ali <mufeed@kumo.foo>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Federico Cassani <federico dot cassani at outlook dot com>
pkgname=python-wn
_name=${pkgname#python-}
pkgver=1.1.1
pkgrel=1
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
sha256sums=('562f2c447f78680c689d97811f90fded2f931974b5c16fa0a5c43084b05c49c4')

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
