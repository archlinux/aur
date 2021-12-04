# Maintainer: Wüstengecko <1579756+Wuestengecko@users.noreply.github.com>
pkgname=python-lsp-mypy
_name=pylsp-mypy
pkgver=0.5.4
pkgrel=1
pkgdesc="Static type checking for python-lsp-server with mypy"
arch=(any)
url="https://github.com/Richardk2n/pylsp-mypy"
license=('MIT')
depends=(python-lsp-server mypy)
makedepends=(python-setuptools)
checkdepends=(python-mock python-pytest python-pytest-cov)
options=(!strip)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ee141284b91f7e11485f1cc4972c93b0e6f479f6ab4fe6ae98a7b1b33e178b63')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

check() {
  cd "$_name-$pkgver"
  PYTHONPATH="$PWD" pytest
}

package() {
  cd "$_name-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
