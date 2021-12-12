# Maintainer: Wüstengecko <1579756+Wuestengecko@users.noreply.github.com>
pkgname=python-lsp-isort
_name=pyls-isort
pkgver=0.2.2
pkgrel=2
pkgdesc="isort plugin for python-lsp-server, sorts imports when formatting"
arch=(any)
url="https://github.com/paradoxxxzero/pyls-isort"
license=('MIT')
depends=(python-lsp-server python-isort)
makedepends=(python-setuptools)
conflicts=(python-pyls-isort)
options=(!strip)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1f0a77d718a8ffdff2120a145b8e4e3f3a0c02eb58222657feed6815db6c7e01')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

check() {
  cd "$_name-$pkgver"
  python -c "import ${_name//-/_}"
}

package() {
  cd "$_name-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
