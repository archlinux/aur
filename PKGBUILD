# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-dynamics
pkgname=python-${_pkgname}
pkgver=0.5.1
pkgrel=4
pkgdesc="Tools for building and solving models of quantum systems in Qiskit"
arch=(any)
url=https://github.com/qiskit-community/qiskit-dynamics
license=(Apache-2.0)
depends=(
    python-arraylias
    python-matplotlib
    python-multiset
    python-numpy
    python-qiskit
    python-scipy
    python-sympy
)
makedepends=(
    python-build
    python-installer
    python-setuptools
    python-wheel
)
#checkdepends=(
#    python-ddt
#    python-jax
#    python-pytest
#    python-qiskit-experiments
#    python-qiskit-ibm-runtime
#)
source=($_pkgname-$pkgver.tar.gz::https://github.com/qiskit-community/$_pkgname/archive/refs/tags/$pkgver.tar.gz)
b2sums=('8f361a8831cb6587e9e95589a646b7af36e6bc94adcea074e86a9b1e45db1b7b29f7bac7012e708915e95a7ca98e7e04540a65d7377c0480aec28fef076e8d95')

#prepare() {
#    # Relative python imports in check() fail because of this missing file
#    touch $_pkgname-$pkgver/test/dynamics/arraylias/register_functions/__init__.py
#}

build() {
    cd $_pkgname-$pkgver
    python -m build --wheel --no-isolation
}

#check() {
#    cd $_pkgname-$pkgver
#    local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
#    python -m installer --destdir=../test_dir dist/*.whl
#    PYTHONPATH=../test_dir/$_site_packages pytest
#}

package() {
    cd $_pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
