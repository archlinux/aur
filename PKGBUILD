# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-machine-learning
pkgname=python-${_pkgname}
pkgver=0.8.1
pkgrel=1
pkgdesc="Quantum Machine Learning package for IBM qiskit framework"
arch=(x86_64)
url="https://github.com/qiskit-community/qiskit-machine-learning"
license=(Apache-2.0)
depends=(
    python-dill
    python-fastdtw
    python-numpy
    python-psutil
    python-qiskit
    python-scikit-learn
    python-scipy
)
makedepends=(
    python-build
    python-installer
    python-setuptools
    python-wheel
)
#checkdepends=(
#     python-ddt
#     python-pytest
#     python-qiskit-ibm-runtime
#)
source=($_pkgname-$pkgver.tar.gz::https://github.com/qiskit-community/$_pkgname/archive/refs/tags/$pkgver.tar.gz)
b2sums=('29f7cc1b0a298fe095356ec971f82013f029c5bafb71e0da79cb7b62a3147c9961f65833b02a8dffb5443ae81eae3ede8c697b91f2a6206447da2966461f9747')

build() {
    cd $_pkgname-$pkgver
    python -m build --wheel --no-isolation
}

#check() {
#     cd $_pkgname-$pkgver
#     local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
#     python -m installer --destdir=../test_dir dist/*.whl
#     # Skip some tests that fail: https://github.com/Qiskit/qiskit/issues/12359
#     PYTHONPATH=../test_dir/$_site_packages pytest -k 'not test_save_load and not test_pickling and not test_vqr and not test_gradient'
#}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
