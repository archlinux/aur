# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-dynamics
pkgname=python-${_pkgname}
pkgver=0.5.0
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
b2sums=('97a552cac445abd767d90330dff968022c2e5b0c2733f5ab2f0483391e801946e203f4ce8f6f070c67f4dfb08e102955b19f81e98f4fd46079bfe95e60493a1d')

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
