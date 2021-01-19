# Maintainer: Eric Berquist <eric dot berquist at gmail dot com>

_name="QCElemental"
_pkgname="qcelemental"
pkgname="python-${_pkgname}"
pkgver=0.17.0
pkgrel=1
pkgdesc="Periodic table, physical constants, and molecule parsing for quantum chemistry"
arch=("any")
url="https://qcelemental-docs.helpmanual.io/"
license=("MIT")
depends=("python-numpy" "python-pint" "python-pydantic")
makedepends=("python-setuptools")
optdepends=("python-networkx")
checkdepends=("python-pytest")
source=("https://github.com/MolSSI/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('389d2d6a452af6520c1c9016807a265e38ff36c50294c35c6c46a0ce97c9e856')


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
  pytest -v ${_pkgname}/
}
