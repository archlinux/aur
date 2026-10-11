# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>

_pkgname=snp2le
pkgname=python-${_pkgname}
pkgver=0.1.11
pkgrel=1
pkgdesc="Convert Touchstone S-parameter files into lumped-elemt netlists for NGSpice and VACASK"
arch=(any)
url="https://github.com/iic-jku/snp2le"
license=('Apache-2.0')
depends=(
    'python'
    'python-scikit-rf'
    'python-numpy'
    'python-scipy'
    'python-matplotlib'
    'python-schemdraw'
    'pyside6'
    'qt6-svg'
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
b2sums=('516719da820761d9e5e4bedf4dfab3cd57bf8ca71dfcd2fe7674770b3cd19a87b13f4b1498b4c4e076a47624a7f3cab0033901871cdf6144416bebc9e19e0b61')

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
