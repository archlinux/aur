# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-dynamics
pkgname=python-${_pkgname}
pkgver=0.5.1
pkgrel=1
pkgdesc="Tools for building and solving models of quantum systems in Qiskit"
arch=('any')
url="https://github.com/Qiskit-Extensions/qiskit-dynamics"
license=('Apache-2.0')
depends=(
    'python-arraylias'
    'python-matplotlib'
    'python-multiset'
    'python-numpy'
    'python-qiskit'
    'python-scipy'
    'python-sympy'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
#checkdepends=(
#    'python-ddt'
#    'python-pytest'
#)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Qiskit-Extensions/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('8f361a8831cb6587e9e95589a646b7af36e6bc94adcea074e86a9b1e45db1b7b29f7bac7012e708915e95a7ca98e7e04540a65d7377c0480aec28fef076e8d95')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

#check() {
#    local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
#    cd "${_pkgname}-${pkgver}"
#    python -m installer --destdir=test_dir dist/*.whl
#    PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-${python_version}" pytest test
#}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
