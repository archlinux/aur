# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>

_pkgname=snp2le
pkgname=python-${_pkgname}
pkgver=0.1.8
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
b2sums=('529a6564ee41f7760319fdb6a9ad5ccfb80580dcd9c20ebc19f35e1aceda5989bfd16300900629fb5bdd60d725863d8b7a3c0e321af4665ed5bc78c212050154')

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
