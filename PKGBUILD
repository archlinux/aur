# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=PythonQwt
pkgname=python-${_name,,}
pkgver=0.14.1
pkgrel=1
pkgdesc="Qt plotting widgets (pure Python reimplementation of Qwt C++ library)"
arch=("any")
url="https://github.com/PlotPyStack/${_name}"
license=('LicenseRef-custom' 'MIT' 'LGPL-2.1-or-later')
depends=(python python-pyqt5 qt5-svg python-qtpy shiboken6 python-numpy)
optdepends=('python-pytest7: tests')
makedepends=(python-setuptools)
source=("${_name}-${pkgver}.tar.gz::https://github.com/PlotPyStack/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("56e64b3ae0afa5819e15949adabcd85655cdef5f16bf846d5b8e9abd237893ea")

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
