# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-awkward
pkgver=0.12.2
pkgrel=1
pkgdesc="Manipulate jagged, chunky, and/or bitmasked arrays as easily as Numpy"
url="https://github.com/scikit-hep/awkward-array"
license=('BSD')
arch=('any')
depends=('python-numpy')
makedepends=('python-setuptools' 'python-pytest-runner')
checkdepends=('python-h5py')
source=("$pkgname-$pkgver.tar.gz::https://github.com/scikit-hep/awkward-array/archive/$pkgver.tar.gz")
sha512sums=('afaf6b5e78fb792cf2909af1b2d94c6045d1efabd85ff04411967f13e60655862b2c95b7760ada8aa35cd5c07c49e5c2b7801d830d59b03d0e09f3cf406bdc82')

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
