# Maintainer: Eric Berquist <eric dot berquist at gmail dot com>

_name="QCEngine"
_pkgname="qcengine"
pkgname="python-${_pkgname}"
pkgver=0.33.0
pkgrel=1
pkgdesc="Quantum chemistry program executor and IO standardizer (QCSchema) for quantum chemistry"
arch=("any")
url="http://docs.qcarchive.molssi.org/projects/QCEngine/en/stable/"
license=("MIT")
makedepends=("python-setuptools")
depends=("python-qcelemental" "python-py-cpuinfo" "python-psutil")
optdepends=(
  "dftd3"
  "dftd4"
  "gamess"
  "mopac"
  "mrchem"
  "nwchem"
  "openmm"
  "psi4"
  "python-optking"
  "python-pyberny"
  "rdkit"
  "xtb"
)
checkdepends=("python-msgpack" "python-pytest")
source=("https://github.com/MolSSI/${_name}/archive/v${pkgver}.tar.gz")
sha256sums=('7d9317355294b2118b9e959e57394eb3f2205db004d9ebe7441cd5026a7fc6c4')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

check() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m pytest -v
}
