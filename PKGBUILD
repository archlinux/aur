# Maintainer: Eric Berquist <eric dot berquist at gmail dot com>

_name="QCEngine"
_pkgname="qcengine"
pkgname="python-${_pkgname}"
pkgver=0.29.0
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
  "rdkit"
  "xtb"
)
checkdepends=("python-msgpack" "python-pytest")
source=("https://github.com/MolSSI/${_name}/archive/v${pkgver}.tar.gz")
sha256sums=('7d84cff53077345282cdf438e8ddfef8d006ed722a3fd0d2c25e2d7ff4e69cf9')

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
