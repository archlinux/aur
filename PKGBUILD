# Maintainer: Do1e <https://aur.archlinux.org/account/Do1e>

pkgname=python-mijia-api
pkgver=4.2.1
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

source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/a0/5a/50ef1524fe10024d63a57f0a06348f9264994e691af17e3fd5adf875fc48/mijiaapi-4.2.1.tar.gz")
sha256sums=('16c2d21914f9e2d7dc2d58074a7f007ecc05f5081a721e860696185d71b73daa')

build() {
  cd "mijiaapi-$pkgver"
  uv build
}

package() {
  cd "mijiaapi-$pkgver"
  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
