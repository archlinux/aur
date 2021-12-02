# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-awkward
pkgver=0.15.5
pkgrel=4
pkgdesc="Manipulate jagged, chunky, and/or bitmasked arrays as easily as Numpy"
url="https://github.com/scikit-hep/awkward-0.x"
license=('BSD')
arch=('any')
depends=('python-numpy')
makedepends=('python-setuptools' 'python-pytest-runner')
checkdepends=('python-h5py' 'python-pandas')
source=("${pkgname}::https://github.com/scikit-hep/awkward-0.x/archive/${pkgver}.tar.gz")
sha512sums=('b0160a916a7bf52b46ff98b83fe7145554e6122b6b574fa76d07312fedad8044cef43e72186c4434496da99455bd947a3fce4bca8f8c591816d91e7b6a499051')

get_pyver () {
    python -c 'import sys; print(str(sys.version_info[0]) + "." + str(sys.version_info[1]))'
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
  ln -s "/usr/lib/python$(get_pyver)/site-packages/awkward0" "${pkgdir}/usr/lib/python$(get_pyver)/site-packages/awkward"
}
