# Maintainer: Do1e <https://aur.archlinux.org/account/Do1e>

pkgname=python-mijia-api
pkgver=2.0.2
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

source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/03/22/91109afb6f513f65324b1ec8ed1cdc3a3c800dadc8d3d01cdcc2e6024e99/mijiaapi-2.0.2.tar.gz")
sha256sums=('ef36cd7a616c4449ea26f22d64a88de7d87b69494b5c41abf0206d8df41a51b1')

build() {
  cd "mijiaapi-$pkgver"
  original_venv_setting=$(poetry config virtualenvs.create --local)
  poetry config virtualenvs.create false
  poetry build
  poetry config virtualenvs.create "$original_venv_setting"
}

package() {
  cd "mijiaapi-$pkgver"
  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
