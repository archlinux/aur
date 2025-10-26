# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=PythonQwt
pkgname=python-${_name,,}
pkgver=0.15.0
pkgrel=1
pkgdesc="Qt plotting widgets (pure Python reimplementation of Qwt C++ library)"
arch=("any")
url="https://github.com/PlotPyStack/${_name}"
license=('LicenseRef-custom')
depends=(python python-pyqt5 qt5-svg python-qtpy shiboken6 python-numpy)
optdepends=('python-pytest: tests')
makedepends=(python-setuptools)
source=("${_name}-${pkgver}.tar.gz::https://github.com/PlotPyStack/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("50fa889e09315236e2d406c31fdc2a7800135b434637c410db417cd669872640")

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
