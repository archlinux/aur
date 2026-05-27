# Maintainer: Do1e <https://aur.archlinux.org/account/Do1e>

pkgname=python-mijia-api
pkgver=3.1.0
pkgrel=1
pkgdesc="A Python API for Xiaomi Mijia"
arch=('any')
url='https://github.com/Do1e/mijia-api'
license=('GPL-3.0')
depends=(
  'python>=3.9'
  'python-pillow>=11.3.0'
  'python-pycryptodome>=3.23.0'
  'python-qrcode>=8.2'
  'python-requests>=2.32.5'
  'python-tzlocal>=1:5.3.1'
)
makedepends=(uv)

source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/5c/a2/d636bbfc395426765ccbc3c7faa2117e7aff0c91c33808f5313663e20cca/mijiaapi-3.1.0.tar.gz")
sha256sums=('376a05b56a8556dea4fbca469014a4626d744d8746f6b380a8ca01d8efe7c797')

build() {
  cd "mijiaapi-$pkgver"
  uv build
}

package() {
  cd "mijiaapi-$pkgver"
  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
