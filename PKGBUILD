# Maintainer: Eisuke Kawashima <e DOT kawaschima+arch AT gmail DOT com>
# Contributor: Eric Berquist <eric dot berquist at gmail dot com>

_name="QCEngine"
_pkgname="${_name,,}"
pkgname="python-${_pkgname}"
pkgver=0.33.0
pkgrel=3
pkgdesc='Quantum chemistry program executor and IO standardizer (QCSchema) for quantum chemistry'
arch=('any')
url='https://molssi.github.io/QCEngine/'
license=('BSD-3-Clause')
makedepends=('python-build' 'python-installer' 'python-wheel')
depends=('python-qcelemental' 'python-py-cpuinfo' 'python-psutil')
optdepends=(
  'dftd3'
  'dftd4'
  'gamess'
  'mopac'
  'mrchem'
  'nwchem'
  'openmm'
  'psi4'
  'python-optking'
  'python-pyberny'
  'rdkit'
  'xtb'
)
checkdepends=('python-msgpack' 'python-pytest')
source=("${_name}-v${pkgver}.tar.gz::https://github.com/MolSSI/${_name}/archive/v${pkgver}.tar.gz")
sha256sums=('7d9317355294b2118b9e959e57394eb3f2205db004d9ebe7441cd5026a7fc6c4')

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
