# Maintainer: Donald Webster <fryfrog@gmail.com>
# Co-Maintainer: Mark Wagie <mark dot wagie at proton dot me>

pkgname=python-backoff
_name=${pkgname#python-}
pkgver=2.2.1
pkgrel=2
pkgdesc="Python library providing function decorators for configurable backoff and retry"
arch=('any')
url="https://github.com/litl/backoff"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
checkdepends=('python-pytest-asyncio' 'python-pytest-cov' 'python-responses')
source=("$_name-$pkgver.tar.gz::https://github.com/litl/backoff/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7b92e74aac38ec49e97ac899c96c882496c7b09cf4235e8da205e62b2c6c001d')

build() {
  cd "$_name-$pkgver"
  GIT_DIR='.' python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  PYTHONPATH=. pytest --cov-report term-missing --cov backoff tests
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
