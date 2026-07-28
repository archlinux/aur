# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>

_pkgname=snp2le
pkgname=python-${_pkgname}
pkgver=0.1.6
pkgrel=1
pkgdesc="Convert Touchstone S-parameter files into lumped-elemt netlists for NGSpice and VACASK"
arch=(any)
url="https://github.com/iic-jku/snp2le"
license=('Apache-2.0')
depends=(
    'python'
    'pyside6'
    'python-scikit-rf'
    'python-numpy'
    'python-scipy'
    'python-matplotlib'
    'python-schemdraw'
)
makedepends=(
    'git'
    'python-build'
    'python-wheel'
    'python-installer'
    'python-setuptools'
)
checkdepends=(
    'python-pytest'
)
optdepends=(
    'ngspice: SPICE simulator to simulate/verify results'
    'vacask: SPICE simulator to simulate/verify results'
)
source=("${_pkgname}::git+${url}#tag=v${pkgver}")
b2sums=('e073e01c42da1901fdf4b4b2b96ce57d68255f33943bdaf9b0f8a077db0354661aefbee6d42f8a112aaa3c1a98ab6d049715e04ff8cb7ce6bdd62ff6b618e7d8')

build() {
    cd "${_pkgname}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${_pkgname}"
    pytest
}

package() {
    cd "${_pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

# vim: set ts=4 sw=4 et:
