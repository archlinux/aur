# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=pymca
pkgname=python-pymca5
pkgver=5.9.7
pkgrel=2
pkgdesc="Mapping and X-Ray Fluorescence Analysis"
arch=('x86_64')
url='https://github.com/silx-kit/pymca'
license=('MIT')
depends=(python-numpy python-fisx python-h5py python-matplotlib python-scipy python-pyqt5 python-opengl python-qtconsole)
optdepends=("python-silx: silx-based plot widgets and HDF5 helpers")
makedepends=(python-setuptools cython python-build python-installer python-wheel)
source=("${_name}-${pkgver}.tar.gz::https://github.com/silx-kit/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e2f1c8c5e98113c72e73c5d923f77062d63904a03c4f9bf46620f3d4e7a630c8')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt"
}
