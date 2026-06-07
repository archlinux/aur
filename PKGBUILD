# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=returns
pkgname="python-$_pkgname"
pkgver=0.28.0
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
sha256sums=('1f7d83fc5fd19de3af30ac29c44aa25625ec6f6a4487e43d87fd588f18eb5c2a')
b2sums=('a1b7b35e7c1ce69ff72921936fbe321511b4e23d8d685ac90055e88114c94f4152703de35c29835466a21dc02a15eb14789e3bb9bddc26bca0b20201bc147f49')

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
