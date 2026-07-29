# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>

_pkgname=snp2le
pkgname=python-${_pkgname}
pkgver=0.1.7
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
b2sums=('90917ecf7e2be1c8482b80cf6211a67f7a4dd27babe2ef4a3b0db49c2dc21f8b74899bfd9127f855cd143ec0265a7adf842aefc570eb0b9dd5bac2d2f9fba8dd')

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
