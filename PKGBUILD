# Maintainer: Do1e <https://aur.archlinux.org/account/Do1e>

pkgname=python-mijia-api
pkgver=2.0.1
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

source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/05/ec/e72552ab643c39420cf8b00099ba4af6e7e4f7700d0fe567ddb128bd55b5/mijiaapi-2.0.1.tar.gz")
sha256sums=('350f5630569a3b2f9b566b7809fe56471a6a2dae5561e2e9092eb9b999a2c105')

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
