# Maintainer: Do1e <https://aur.archlinux.org/account/Do1e>

pkgname=python-mijia-api
pkgver=3.0.4
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

source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/fe/82/bb532bbd5c00de8cd6097ac30b8311e8f42ccdf226f61444d18ad52f3c28/mijiaapi-3.0.4.tar.gz")
sha256sums=('d9dbf7bbaa5067f2750bc390b4b516488ca47dba67736600bac618a595431525')

build() {
  cd "mijiaapi-$pkgver"
  uv build
}

package() {
  cd "mijiaapi-$pkgver"
  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
