# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-awkward
pkgver=0.8.14
pkgrel=1
pkgdesc="Manipulate jagged, chunky, and/or bitmasked arrays as easily as Numpy"
url="https://github.com/scikit-hep/awkward-array"
license=('BSD')
arch=('any')
depends=('python-numpy')
makedepends=('python-setuptools' 'python-pytest-runner')
checkdepends=('python-h5py')
source=("$pkgname-$pkgver.tar.gz::https://github.com/scikit-hep/awkward-array/archive/$pkgver.tar.gz")
sha512sums=('f5741d9cdc7f7002aa3b077b9e0116604b0597620e8b976f3c79c146ceace349bc5f2ceb4d9e9d4c37de5efac56e11fffcbb87266868deb43fe75d3f3a9dc1a9')

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
