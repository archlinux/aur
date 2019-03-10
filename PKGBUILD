# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-awkward
pkgver=0.8.10
pkgrel=1
pkgdesc="Manipulate jagged, chunky, and/or bitmasked arrays as easily as Numpy"
url="https://github.com/scikit-hep/awkward-array"
license=('BSD')
arch=('any')
depends=('python-numpy')
makedepends=('python-setuptools' 'python-pytest-runner')
checkdepends=('python-h5py')
source=("$pkgname-$pkgver.tar.gz::https://github.com/scikit-hep/awkward-array/archive/$pkgver.tar.gz")
sha512sums=('2093d1957d9b34f67b1600790640c0affb01f7649b88ad7fe91a9c1aa6385e9c0c88c22aff48260716064c21bfb384f298c94d004721e97e7ccb5fb3df884ee2')

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
