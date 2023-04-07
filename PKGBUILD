# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-paver
pkgver=1.3.4
pkgrel=7
pkgdesc="Python-based project scripting"
url="https://github.com/paver/paver"
license=('BSD')
arch=('any')
depends=('python-six')
makedepends=('python-setuptools')
checkdepends=('python-cogapp' 'python-nose' 'python-virtualenv')
source=("$pkgname-$pkgver.tar.gz::https://github.com/paver/paver/archive/Paver-$pkgver.tar.gz")
sha512sums=('5747235b81df1dc8726bfa949f13c544e03c596f58c8bfc7ab55cc285f793fbb44cbcaa98acbc6e4a0554418755d3d70246b0e37249473b062d54a23b6bea35f')

prepare() {
  cd paver-Paver-$pkgver
  sed -i 's/from unittest2 import/from unittest import/' tests_integration/*.py
}

build() {
  cd paver-Paver-$pkgver
  python setup.py build
}

check() {
  cd paver-Paver-$pkgver
  # https://github.com/paver/paver/issues/205
  python setup.py nosetests || :
}

package() {
  cd paver-Paver-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
