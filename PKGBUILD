# Maintainer: Eisuke Kawashima <e DOT kawaschima+arch AT gmail DOT com>
# Contributor: Eric Berquist <eric dot berquist at gmail dot com>

_name="QCEngine"
_pkgname="${_name,,}"
pkgname="python-${_pkgname}"
pkgver=0.50.0
pkgrel=1
pkgdesc='Quantum chemistry program executor and IO standardizer (QCSchema) for quantum chemistry'
arch=('any')
url='https://molssi.github.io/QCEngine/'
license=('BSD-3-Clause')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools-scm')
depends=(
  'python'
  'python-numpy'
  'python-psutil'
  'python-py-cpuinfo'
  'python-pydantic'
  'python-yaml'
  # AUR
  'python-qcelemental'
)
optdepends=(
  'python-msgpack'
  'python-pkg_resources'
  'python-pytest'
  'python-pytorch'
  'rdkit'
  # AUR
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
  'xtb'
)
checkdepends=('python-pydantic-settings' 'python-pytest')
source=("git+https://github.com/MolSSI/${_name}.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${_name}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_name}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

check() {
  cd "${srcdir}/${_name}"
  python -m pytest -v
}
