# Maintainer: Eric Berquist <eric dot berquist at gmail dot com>

_name="QCElemental"
_pkgname="qcelemental"
pkgname="python-${_pkgname}"
pkgver=0.13.1
pkgrel=1
pkgdesc=" Periodic table, physical constants, and molecule parsing for quantum chemistry"
arch=("any")
url="https://qcelemental-docs.helpmanual.io/"
license=("MIT")
depends=("python-numpy" "python-pint" "python-pydantic")
makedepends=("python-setuptools")
optdepends=("python-networkx")
checkdepends=("python-pytest-cov")
source=("https://github.com/MolSSI/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('726bd30e3dd53539421f2ff9a6e8d5b4b090e9cc64eaeec04bd2f474a34613c2')

build() {
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

check() {
  cd "${srcdir}/${_name}-${pkgver}"
  pytest -v --cov=${_pkgname}/ ${_pkgname}/
}
