# Maintainer: Eric Berquist <eric dot berquist at gmail dot com>

_name="QCElemental"
_pkgname="qcelemental"
pkgname="python-${_pkgname}"
pkgver=0.28.0
pkgrel=2
pkgdesc="Periodic table, physical constants, and molecule parsing for quantum chemistry"
arch=("any")
url="https://docs.qcarchive.molssi.org/projects/qcelemental/en/latest/"
license=("MIT")
depends=("python-numpy" "python-pint" "python-pydantic")
makedepends=("python-build" "python-installer" "python-poetry" "python-wheel")
optdepends=("python-networkx")
checkdepends=("python-pytest")
source=("https://github.com/MolSSI/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('59f2104095b2d5bd78b02149c50c06fa884cde9fc2f49272edd0ec2e7f5fdd3d')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

check() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m pytest -v
}
