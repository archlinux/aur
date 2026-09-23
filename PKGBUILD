# Maintainer: Do1e <https://aur.archlinux.org/account/Do1e>

pkgname=python-mijia-api
pkgver=4.3.0
pkgrel=1
pkgdesc="A Python API for Xiaomi Mijia"
arch=('any')
url='https://github.com/Do1e/mijia-api'
license=('GPL-3.0')
depends=(
  'python>=3.10'
  'python-fastmcp>=3.4.2'
  'python-pillow>=11.3.0'
  'python-pycryptodome>=3.23.0'
  'python-qrcode>=8.2'
  'python-requests>=2.32.5'
  'python-tzlocal>=1:5.3.1'
)
makedepends=(
  'uv'
  'python-installer'
)

source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/0c/23/3e6302fb54ac27a9587df71682c0ec756a7a5866e55b8963ef2b0032ceb8/mijiaapi-4.3.0.tar.gz")
sha256sums=('0c1df164262f0dfd6f504414d988f3fe139a59245833749a102660a6a378bb62')

build() {
  cd "mijiaapi-$pkgver"
  uv build
}

package() {
  cd "mijiaapi-$pkgver"
  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
