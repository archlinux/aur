# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-uncertainties
pkgver=3.1.7
pkgrel=1
pkgdesc="Transparent calculations with uncertainties on the quantities involved (aka error propagation); fast calculation of derivatives."
arch=('any')
license=('BSD')
url="https://github.com/lebigot/uncertainties"
depends=('python38-future')
optdepends=('python38-numpy: additional support for NumPy arrays and matrices')
makedepends=('python38-setuptools')
checkdepends=('python38-nose' 'python38-numpy' 'python38-tests')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lebigot/uncertainties/archive/$pkgver.tar.gz")
sha512sums=('debfa1bcad4d6785f8a26c92f9de1032e40c7672a61763a65f0c1eaed2f4b572394c7db4e45a411ea43239e3a311a2defa7d6a7f4b0cb4368cfcfbc4f050886e')

build() {
  cd uncertainties-$pkgver
  python3.8 setup.py build
}

check() {
  cd uncertainties-$pkgver
  nosetests
}

package() {
  cd uncertainties-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
