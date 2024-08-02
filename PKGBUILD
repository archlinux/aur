# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=pymca
pkgname=python-pymca5
pkgver=5.9.3
pkgrel=1
pkgdesc="Mapping and X-Ray Fluorescence Analysis"
arch=('x86_64')
url='http://www.silx.org/doc/PyMca/dev/'
license=('MIT')
depends=(python-numpy python-fisx python-h5py python-matplotlib python-scipy python-pyqt5 python-opengl python-qtconsole python-pyqt5-webengine)
makedepends=(python-setuptools python-numpy python-fisx cython python-build python-installer python-wheel python-setuptools)
source=("${_name}-${pkgver}.tar.gz::https://github.com/vasole/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("6d8f1f34e1f3ac437239e2cf4e6c47f7de6d077cae765eb0ca2e48c131416f82")

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt"
}
