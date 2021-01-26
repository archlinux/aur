# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-awkward
pkgver=0.15.3
pkgrel=1
pkgdesc="Manipulate jagged, chunky, and/or bitmasked arrays as easily as Numpy"
url="https://github.com/scikit-hep/awkward-0.x"
license=('BSD')
arch=('any')
depends=('python-numpy')
makedepends=('python-setuptools' 'python-pytest-runner')
checkdepends=('python-h5py' 'python-pandas')
source=("https://github.com/scikit-hep/awkward-0.x/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('5acb08af17b5d39283d0c895d4c08c35ef3ed798b9fc8adc9177165919457c4ede596e2cbdab26a082eef452032714e4a78210f43ae19fc8d911b236c72937cb')

build() {
  cd awkward-0.x-$pkgver
  python setup.py build
}

check() {
  cd awkward-0.x-$pkgver
  pytest tests
}

package() {
  cd awkward-0.x-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
