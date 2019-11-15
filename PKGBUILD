# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-awkward
pkgver=0.12.15
pkgrel=1
pkgdesc="Manipulate jagged, chunky, and/or bitmasked arrays as easily as Numpy"
url="https://github.com/scikit-hep/awkward-array"
license=('BSD')
arch=('any')
depends=('python-numpy')
makedepends=('python-setuptools' 'python-pytest-runner')
checkdepends=('python-h5py')
source=("$pkgname-$pkgver.tar.gz::https://github.com/scikit-hep/awkward-array/archive/$pkgver.tar.gz")
sha512sums=('0f7f589d8d04c9300a05ca44f4dc90d133b103ce08e914228ba9bfacdbcf07b4209ff3779384d84c23f7372e1d9093ed15721dcda6aee8381dcc1b2c6a2e9d58')

build() {
  cd awkward-array-$pkgver
  python setup.py build
}

check() {
  cd awkward-array-$pkgver
  python setup.py pytest
}

package() {
  cd awkward-array-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
