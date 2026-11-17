# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=returns
pkgname="python-$_pkgname"
pkgver=0.30.0
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
sha256sums=('13e58c5e4ea3f27bd16b7a3ec666f1b7bc283116d2cf328ae48e3226d3076993')
b2sums=('bfd02669fc4d853621ce68f5e3f1746a66a49a276017317101a0652edd430c5104063bde89a223941ee5fa5ce8dd8c3b1dff3d18ef6b2e0b78bd97b9030bc2cb')

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
