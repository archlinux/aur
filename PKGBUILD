# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=PythonQwt
pkgname=python-${_name,,}
pkgver=0.14.6
pkgrel=1
pkgdesc="Qt plotting widgets (pure Python reimplementation of Qwt C++ library)"
arch=("any")
url="https://github.com/PlotPyStack/${_name}"
license=('LicenseRef-custom')
depends=(python python-pyqt5 qt5-svg python-qtpy shiboken6 python-numpy)
optdepends=('python-pytest: tests')
makedepends=(python-setuptools)
source=("${_name}-${pkgver}.tar.gz::https://github.com/PlotPyStack/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("5ea488e6619d7986908028d38105a3eb94ad9a621318f4914355fbf0511db2d9")

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
