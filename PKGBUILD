# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=pymca
pkgname=python-pymca5
pkgver=5.9.5
pkgrel=1
pkgdesc="Mapping and X-Ray Fluorescence Analysis"
arch=('x86_64')
url='https://github.com/silx-kit/pymca'
license=('MIT')
depends=(python-numpy python-fisx python-h5py python-matplotlib python-scipy python-pyqt5 python-opengl python-qtconsole python-pyqt5-webengine)
makedepends=(python-setuptools python-numpy python-fisx cython python-build python-installer python-wheel python-setuptools)
source=("${_name}-${pkgver}.tar.gz::https://github.com/silx-kit/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("a54adfff9ae76f79e173f143138fd373ed5de17e6d4f1b226cb3a23cc417ab82")

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt"
}
