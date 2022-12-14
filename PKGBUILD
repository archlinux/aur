# Maintainer: Wüstengecko <1579756+Wuestengecko@users.noreply.github.com>
pkgbase=python-lsp-mypy
pkgname=(python-pylsp-mypy)
_name=${pkgname#python-}
pkgver=0.6.4
pkgrel=1
pkgdesc="Static type checking for python-lsp-server with mypy"
arch=(any)
url="https://github.com/python-lsp/pylsp-mypy"
license=('MIT')
depends=(python-lsp-server mypy python-toml)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
options=(!strip)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f7b8c94cd25d974126a4fdced8f1535c742d2a8369f542e2b870975ec8c54bc3')

build() {
  cd "$_name-$pkgver"
  PYTHONHASHSEED=0 python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  PYTHONPATH="$PWD" pytest
}

package_python-pylsp-mypy() {
  conflicts=(python-lsp-mypy)
  provides=(python-lsp-mypy)
  replaces=(python-lsp-mypy)

  cd "$_name-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
}
