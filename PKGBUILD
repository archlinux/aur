# Maintainer: Eric Berquist <eric dot berquist at gmail dot com>

_name="QCElemental"
_pkgname="qcelemental"
pkgname="python-${_pkgname}"
pkgver=0.27.1
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
sha256sums=('10686a022e7e85259d6ee1730c29cedff1b67c8a21d753b336fb4c42529922b1')

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
