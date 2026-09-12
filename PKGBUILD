# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-experiments
pkgname=python-$_pkgname
pkgver=0.14.2
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
    python-qiskit-ibm-runtime
    python-rustworkx
    python-scipy
    python-uncertainties
)
makedepends=(
    python-build
    python-installer
    python-setuptools
    python-setuptools-scm
    python-wheel
)
optdepends=(
    'python-cvxpy: for tomography'
    'python-scikit-learn: for discriminators'
    'python-qiskit-aer: for simulating backends'
    'python-qiskit-dynamics: for the PulseBackend'
    'python-pyyaml: support for storing yaml files in local experiments'
)
checkdepends=(
    python-cvxpy
    python-ddt
    python-fixtures
    python-multimethod
    python-pytest
    python-qiskit-aer
    python-scikit-learn
    python-testtools
    python-pyyaml
)
source=($_pkgname-$pkgver.tar.gz::https://github.com/Qiskit-Community/$_pkgname/archive/refs/tags/$pkgver.tar.gz)
b2sums=('5b4b5b83750493978f9c4f2ae2a4ddbd7eca68a16b89e88ede267cad76d3eeb31d696403a80e7057012a94b10f73532d18d42f0795968b851bb0b0a3a39bd483')

build() {
    cd $_pkgname-$pkgver
    python -m build --wheel --no-isolation
}

check() {
    cd $_pkgname-$pkgver
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    test-env/bin/python -P -m pytest -o addopts="" -k "not test_expdata_serialization"
}

package() {
    cd $_pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
