# Maintainer: Do1e <https://aur.archlinux.org/account/Do1e>

pkgname=python-mijia-api
pkgver=3.2.0
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
makedepends=(
  'uv'
  'python-installer'
)

source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/68/41/5e2fc298bafd1b1c95ac3572c05a98a5c2db54c5d80becd8b3f97b697ac0/mijiaapi-3.2.0.tar.gz")
sha256sums=('55374a877b1a1695ec7fab8b2630a9b3fc04108f9710577665c8f0bc751d3952')

build() {
  cd "mijiaapi-$pkgver"
  uv build
}

package() {
  cd "mijiaapi-$pkgver"
  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
