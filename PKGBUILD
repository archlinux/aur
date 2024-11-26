# Maintainer: Eric Berquist <eric dot berquist at gmail dot com>

_name="QCEngine"
_pkgname="qcengine"
pkgname="python-${_pkgname}"
pkgver=0.30.0
pkgrel=2
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
sha256sums=('896c690fa82a5f65b6d702775ac61606dc54050f8642f0c04b6497c5f9bdca62')

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
