# Maintainer: Do1e <https://aur.archlinux.org/account/Do1e>

pkgname=python-njulogin
pkgver=5.1.1
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

source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/53/a3/868ffd6086c2a24592a3054b8acfc98b85151498c0a3e6ae17abb0d697d8/njulogin-5.1.1.tar.gz")
sha256sums=('0cc1d967b48fbed6efe21b5ef7200f70d5be4b6ba58475e759c1f17ca7f8aa60')

build() {
  cd "njulogin-$pkgver"
  uv build
}

package() {
  cd "njulogin-$pkgver"
  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
