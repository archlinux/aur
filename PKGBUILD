# Maintainer: Eric Berquist <eric dot berquist at gmail dot com>

_name="QCElemental"
_pkgname="qcelemental"
pkgname="python-${_pkgname}"
pkgver=0.29.0
pkgrel=1
pkgdesc="Periodic table, physical constants, and molecule parsing for quantum chemistry"
arch=("any")
url="https://docs.qcarchive.molssi.org/projects/qcelemental/en/latest/"
license=("MIT")
depends=("python-numpy" "python-pint" "python-pydantic")
makedepends=("python-build" "python-installer" "python-poetry" "python-wheel")
optdepends=("python-networkx")
checkdepends=("python-pytest")
source=("https://github.com/MolSSI/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('3571b9bc6c67faba8ea9d988948fd8efc593bf3b5d533486f84ee2e423d60c1e')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

# importlib.metadata.PackageNotFoundError: No package metadata was found for qcelemental
# check() {
#   cd "${srcdir}/${_name}-${pkgver}"
#   python -m pytest -v
# }
