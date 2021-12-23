# Maintainer: Wüstengecko <1579756+Wuestengecko@users.noreply.github.com>
pkgname=python-lsp-mypy
_name=pylsp-mypy
pkgver=0.5.7
pkgrel=1
pkgdesc="Static type checking for python-lsp-server with mypy"
arch=(any)
url="https://github.com/Richardk2n/pylsp-mypy"
license=('MIT')
depends=(python-lsp-server mypy
  # https://bugs.archlinux.org/task/73090
  python-tomli
)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
options=(!strip)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b4bada653732527926bb38bd891836b5080b98473a487c7e6d245547d0e6aba8')

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
