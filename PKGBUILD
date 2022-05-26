# Maintainer: Wüstengecko <1579756+Wuestengecko@users.noreply.github.com>
pkgbase=python-lsp-mypy
pkgname=(python-pylsp-mypy)
_name=${pkgname#python-}
pkgver=0.5.8
pkgrel=1
pkgdesc="Static type checking for python-lsp-server with mypy"
arch=(any)
url="https://github.com/python-lsp/pylsp-mypy"
license=('MIT')
depends=(python-lsp-server mypy python-toml)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
options=(!strip)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('9a292703191415959e7a1c1dda077a1f0371c676c10832ed76eb814ba1113d4f')

build() {
  cd "$_name-$pkgver"
  python setup.py build
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
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
