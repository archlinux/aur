# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-awkward
pkgver=0.5.5
pkgrel=1
pkgdesc="Manipulate jagged, chunky, and/or bitmasked arrays as easily as Numpy"
url="https://github.com/scikit-hep/awkward-array"
license=('BSD')
arch=('any')
depends=('python-numpy')
makedepends=('python-setuptools' 'python-pytest-runner')
checkdepends=('python-h5py')
source=("$pkgname-$pkgver.tar.gz::https://github.com/scikit-hep/awkward-array/archive/$pkgver.tar.gz")
sha512sums=('3f28f45510407de0792bd87bee1aacf7239a4130471333a8d9d923681d9e1d6209ffa71c28551171a6879cbbc544306b28573d04c607b6ba6157c68b13eecc1f')

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

  rm "$pkgdir"/usr/README.rst
}
