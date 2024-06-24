# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=PythonQwt
pkgname=python-${_name,,}
pkgver=0.12.5
pkgrel=1
pkgdesc="Qt plotting widgets (pure Python reimplementation of Qwt C++ library)"
arch=("any")
url="https://github.com/PlotPyStack/${_name}"
license=('custom')
depends=(python-pyqt5 qt5-svg python-qtpy python-numpy)
makedepends=(python-setuptools)
source=("${_name}-${pkgver}.tar.gz::https://github.com/PlotPyStack/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("fb60e2a7b91565305b9d088823fd98a56900920f145d211d9dd4181d8b6d7323")

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
