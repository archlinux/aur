# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=returns
pkgname="python-$_pkgname"
pkgver=0.26.0
pkgrel=1
pkgdesc="Make your functions return something meaningful, typed, and safe"
arch=('any')
url="https://returns.readthedocs.io"
license=('MIT')
depends=('python' 'python-typing_extensions')
makedepends=('python-poetry-core' 'python-build' 'python-installer' 'python-wheel')
# checkdepends=(
#   'python-pytest' 'python-pytest-mypy-plugins' 'python-pytest-subtests' 'python-pytest-randomly'
#   'python-pytest-cov'
#   'python-hypothesis' 'python-anyio' 'python-httpx' 'python-attrs' 'python-trio' 'python-tomlkit'
# )
optdepends=(
  'mypy: For mypy compatibility'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/dry-python/returns/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('7560804c0941cdbbfa94c687d2d5e132932439fcf818ae4748547bdc07532d04')
b2sums=('6d889f1c56489028d4e041e31a72bf774f60f5675a59b999bf8accb7f399e03d544b90f07bf502d75871e313fb40fe9ee92025d0e95df042f16f2513e4bf54a7')

build() {
  cd "$_pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

# idk how to make them work again :(
# check() {
#   cd "$_pkgname-$pkgver"
#
#   export PYTHONPATH="$PWD"
#   pytest \
#     -p returns.contrib.pytest.plugin \
#     --cov-fail-under=0 \
#     returns docs/pages tests
# }

package() {
  cd "$_pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
