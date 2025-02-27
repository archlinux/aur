# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-experiments
pkgname=python-$_pkgname
pkgver=0.8.2
pkgrel=1
pkgdesc="Qiskit Experiments package for IBM qiskit framework"
arch=(any)
url=https://github.com/Qiskit-Community/qiskit-experiments
license=(Apache-2.0)
depends=(
    python-lmfit
    python-matplotlib
    python-numpy
    python-packaging
    python-pandas
    python-qiskit
    python-qiskit-ibm-experiment
    python-rustworkx
    python-scipy
    python-uncertainties
)
makedepends=(
    python-build
    python-installer
    python-setuptools
    python-wheel
)
optdepends=(
    'python-cvxpy: for tomography'
    'python-scikit-learn: for discriminators'
    'python-qiskit-aer'
    'python-qiskit-dynamics: for the PulseBackend'
)
# checkdepends=(
#    python-ddt
#    python-fixtures
#    python-multimethod
#    python-pytest
#    python-qiskit-aer
#    python-testtools
# )
source=($_pkgname-$pkgver.tar.gz::https://github.com/Qiskit-Community/$_pkgname/archive/refs/tags/$pkgver.tar.gz)
b2sums=('60d24412b0fceba4db4f7ac4f70216d4fee033984fcfc23f2bd93d64b4c5d1be00052419aa8e746880ffce3f960998c6346a3d9b9411b7f50da29c63d40e4b98')

build() {
    cd $_pkgname-$pkgver
    python -m build --wheel --no-isolation
}

# check() {
#    cd $_pkgname-$pkgver
#    local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
#    python -m installer --destdir=../test_dir dist/*.whl
#    PYTHONPATH=../test_dir/$_site_packages pytest
# }

package() {
    cd $_pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
