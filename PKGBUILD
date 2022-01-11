# Maintainer: Eric Berquist <eric dot berquist at gmail dot com>

_name="QCElemental"
_pkgname="qcelemental"
pkgname="python-${_pkgname}"
pkgver=0.24.0
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
sha256sums=('8fb7e580187bb91458a1e9b2e0dd0eca7ed4c48e8c9bfce43a690158860a20d2')


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
