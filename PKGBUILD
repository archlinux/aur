# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-aer
pkgname=python-${_pkgname}
pkgver=0.8.2
pkgrel=1
pkgdesc="A high performance simulator for quantum circuits that includes noise models"
arch=('x86_64')
url="https://github.com/Qiskit/qiskit-aer"
license=('Apache')
depends=(
    'cython'
    'muparserx'
    'nlohmann-json'
    'openblas'
    'python-numpy'
    'python-qiskit-terra'
    'python-scipy'
    'spdlog'
)
optdepends=(
    'cuda: Parallelization with CUDA (NVIDIA)'
    'intel-tbb: Parallelization with Intel TBB'
    'openmp: Parallelization with OpenMP'
    'thrust: Parallelization (GPU/CPU) support'
)
makedepends=(
    'cmake'
    'pybind11'
    'python-pip'
    'python-scikit-build'
    'python-setuptools'
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Qiskit/${_pkgname}/archive/${pkgver}.tar.gz")

sha256sums=('ded2d0ac38fb522420db6b36f403b7182f9cee9e9150c711a0711837a17da3f1')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    DISABLE_CONAN=ON python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
