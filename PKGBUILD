# Maintainer: Do1e <https://aur.archlinux.org/account/Do1e>

pkgname=python-mijia-api
pkgver=1.5.0
pkgrel=1
pkgdesc="A Python API for Xiaomi Mijia"
arch=('any')
url='https://github.com/Do1e/mijia-api'
license=('GPL-3.0')
depends=(
  'python>=3.9'
  'python-pillow>=11.0.0'
  'python-qrcode>=8.0'
  'python-requests>=2.32.3'
)
makedepends=(python-poetry)

source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/25/46/94ff538af0578215d9c8806f8441dd9b49d95cb7de5a7f2502e9dacf638e/mijiaapi-1.5.0.tar.gz")
sha256sums=('282c7b523e491fb61e762140eeea2f4b3af997dccede4689bd2a4397ce92ec18')

build() {
  cd "mijiaapi-$pkgver"
  poetry config virtualenvs.create false
  poetry build
  poetry config virtualenvs.create true
}

package() {
  cd "mijiaapi-$pkgver"
  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
