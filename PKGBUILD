# Maintainer: Do1e <https://aur.archlinux.org/account/Do1e>

pkgname=python-njulogin
pkgver=5.1.0
pkgrel=1
pkgdesc="The Nanjing University login module, which can be used to login to the various campus web sites"
arch=('any')
url='https://github.com/Do1e/NJUlogin'
license=('MIT')
depends=(
  'python>=3.10'
  'python-requests>=2.32.0'
  'python-numpy>=2.0.0'
  'python-opencv>=4.10.0'
  'python-lxml>=5.3.0'
  'python-pycryptodome>=3.21.0'
  'python-cryptography>=43.0.0'
  'python-qrcode>=8.2'
)
makedepends=(
  'uv'
  'python-installer'
)

source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/f3/37/57cfe367572164a1480d963b6127800bd0ae29d3cd29255e2a38c9024e4e/njulogin-5.1.0.tar.gz")
sha256sums=('13efe61d4b38b655356502a0df24606bda5ce0a4660cc0dc03582a4dc4ef8ea8')

build() {
  cd "njulogin-$pkgver"
  uv build
}

package() {
  cd "njulogin-$pkgver"
  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
