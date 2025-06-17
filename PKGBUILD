# Maintainer: Do1e <https://aur.archlinux.org/account/Do1e>

pkgname=python-mijia-api
pkgver=1.4.5
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

source=("$pkgname-$pkgver.tar.gz::"https://files.pythonhosted.org/packages/94/f1/e9169d5b544459cefe6038898ae4953e5733925fb43bf20135e38c39ff1e/mijiaapi-1.4.5.tar.gz)
sha256sums=('872efb565699de893944590538df60e3489093dbe3eb5b1b2dbbdf7cc61858f6')

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
