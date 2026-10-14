# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>

_pkgname=snp2le
pkgname=python-${_pkgname}
pkgver=0.1.17
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
    'python-threadpoolctl'
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
b2sums=('da1dfc554e9e31f8a20dfbfdf263613967531fd1a970dfa005ed61a8cb8c3b439410178e210ac95823f56821f6947fb0ca805d173999cd9482ebb132b13b6c98')

build() {
    cd "${_pkgname}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${_pkgname}"
    # Skip GUI tests
    pytest -k "not gui"
}

package() {
    cd "${_pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

# vim: set ts=4 sw=4 et:
