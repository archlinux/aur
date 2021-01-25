# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-awkward
pkgver=0.15.2
pkgrel=1
pkgdesc="Manipulate jagged, chunky, and/or bitmasked arrays as easily as Numpy"
url="https://github.com/scikit-hep/awkward-0.x"
license=('BSD')
arch=('any')
depends=('python-numpy')
makedepends=('python-setuptools' 'python-pytest-runner')
checkdepends=('python-h5py' 'python-pandas')
source=("https://github.com/scikit-hep/awkward-0.x/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        'deserialize.patch')
sha512sums=('6311e6d94b6a4cc50b9390f2d53e0ccaf67516debc00178fceddbc99912469c5f3345b43a3ed4b956dc7780e2bd565c884eea632151f1730d6a9581f0adb2018'
            '1f168fd68560743f68149e34c33be4a177bc5f9eb526fa7a6fa061c5fb97c70577daaa53e8c763bedc9d6708f2a0ffd8eff1eee402ac162039a0841290c49a15')

prepare() {
  cd awkward-0.x-$pkgver
  patch -Np1 -i "${srcdir}/deserialize.patch"
}

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
