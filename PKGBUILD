# Maintainer: Wüstengecko <1579756+Wuestengecko@users.noreply.github.com>
pkgname=python-datauri
_name=${pkgname}
pkgver=2.0.0
pkgrel=1
pkgdesc="A li'l class for data URI manipulation in Python"
arch=(any)
url="https://github.com/fcurella/python-datauri"
license=('Unlicense')
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pydantic python-pytest)
options=(!strip)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('93f6151eadb3b6a7a8347936681d5938d2d4b4aee7c89f71b7d485b21c72f3d4')

build() {
  cd "$_name-$pkgver"
  PYTHONHASHSEED=0 python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  PYTHONPATH="$PWD" pytest
}

package() {
  cd "$_name-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
  rm -rf "$pkgdir"/usr/lib/python*/site-packages/tests
}
