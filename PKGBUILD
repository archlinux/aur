# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Marco Rubin <marco.rubin@protonmail.com>
_name=quimb
pkgname=python-$_name
pkgver=1.12.1
pkgrel=1
pkgdesc="Quantum information and many-body calculations including tensor networks"
arch=(any)
url=https://github.com/jcmgray/quimb
license=(Apache-2.0)
depends=(
    python-autoray
    python-cotengra
    python-cytoolz
    python-numba
    python-numpy
    python-psutil
    python-scipy
    python-tqdm
)
makedepends=(
    git
    python-build
    python-installer
    python-hatch-vcs
    python-hatchling
    python-wheel
)
optdepends=(
    "python-autograd: support for gradient-based optimizations"
    "python-cmaes: support for Covariance Matrix Adaptation Evolution Strategy (CMA-ES)"
    # "python-cotengrust: for tensor networks"
    # "python-kahypar: support for hypergraphs"
    "python-matplotlib: for plotting"
    "python-mpi4py: support for solvers using MPI"
    "python-networkx: for computing distances between pairs of qubits"
    "pyton-plotly: for plotting"
    "python-pygraphviz: for plotting"
)
checkdepends=(python-pytest)
source=($_name::git+https://github.com/jcmgray/$_name.git#tag=v$pkgver)
b2sums=('83de4f6c191bd208086126e66818d736753487cb3a5af474aeb7a9c89cc35a168eb57b620f7f368930e65e871bfc909b69720e8c92d8e33b4d00c053c8b6e736')

build() {
    cd $_name
    python -m build --wheel --no-isolation
}

check() {
    cd $_name
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    rm -rf $_name
    test-env/bin/python -P -m pytest -o addopts=""
}

package() {
    cd $_name
    python -m installer --destdir="$pkgdir" dist/*.whl
}
