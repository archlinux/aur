# Maintainer: Eric Berquist <eric dot berquist at gmail dot com>

_name="QCElemental"
_pkgname="qcelemental"
pkgname="python-${_pkgname}"
pkgver=0.14.0
pkgrel=2
pkgdesc=" Periodic table, physical constants, and molecule parsing for quantum chemistry"
arch=("any")
url="https://qcelemental-docs.helpmanual.io/"
license=("MIT")
depends=("python-numpy" "python-pint" "python-pydantic")
makedepends=("python-setuptools")
optdepends=("python-networkx")
checkdepends=("python-pytest-cov")
source=("https://github.com/MolSSI/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('ea8615655c227b2a1363f9e6ff8816088229d69ffcf6a913d5b432d211c843ef')

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
