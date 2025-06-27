# Maintainer: Do1e <https://aur.archlinux.org/account/Do1e>

pkgname=python-mijia-api
pkgver=2.0.0
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

source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/4e/d2/6025f03126b1911c85e17d47d8ac12d8e4fd686f9467b48ead92210f02d2/mijiaapi-2.0.0.tar.gz")
sha256sums=('63fcc346166354e6c98dada36933a6df03581743b998e57c140c57c0adcde9a2')

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
