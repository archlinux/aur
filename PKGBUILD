# Maintainer: Danny Waser <danny@waser.tech>
# Maintainer:

_pkgname=socksio
pkgname=python38-$_pkgname
pkgver=1.0.0
pkgrel=1
pkgdesc='Sans-I/O implementation of SOCKS4, SOCKS4A, and SOCKS5'
arch=(any)
url='https://github.com/sethmlarson/socksio'
license=(BSD)
depends=(python38)
checkdepends=(python38-pytest-cov)
source=(https://pypi.python.org/packages/source/${_pkgname:0:1}/${_pkgname/-/_}/${_pkgname/-/_}-${pkgver}.tar.gz)
sha256sums=('f88beb3da5b5c38b9890469de67d0cb0f9d494b78b106ca1845f96c10b91c4ac')

build() {
  cd $_pkgname-$pkgver
  python3.8 setup.py build
}

check() {
  cd $_pkgname-$pkgver
  PYTHONPATH="$PWD" pytest
}

package() {
  cd $_pkgname-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
