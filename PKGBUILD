# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-awkward
pkgver=0.15.0
pkgrel=1
pkgdesc="Manipulate jagged, chunky, and/or bitmasked arrays as easily as Numpy"
url="https://github.com/scikit-hep/awkward-0.x"
license=('BSD')
arch=('any')
depends=('python-numpy')
makedepends=('python-setuptools' 'python-pytest-runner')
checkdepends=('python-h5py' 'python-pandas')
source=("https://github.com/scikit-hep/awkward-0.x/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('93e3871c770927486411e2a392f731aa5b2eb4fa710b912cd6b3d92fd012bed5200c03a3b7ecca4adfd0fe188edf641c5d004bd4c16dfc39d7684fa09db7a4b4')

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
