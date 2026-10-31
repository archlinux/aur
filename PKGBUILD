# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-paulice
pkgname=python-${_pkgname}
pkgver=0.3.0
pkgrel=1
pkgdesc="Embedding spacetime Pauli checks into Clifford circuits"
arch=(x86_64)
url=https://github.com/Qiskit/qiskit-paulice
license=(Apache-2.0)
depends=(
    python-numpy
    python-qiskit
    python-samplomatic
)
makedepends=(
    git
    python-build
    python-installer
    python-maturin
)
checkdepends=(
    python-pytest
    python-qiskit-aer
    python-qiskit-ibm-runtime
)
source=($_pkgname::git+https://github.com/Qiskit/$_pkgname#tag=$pkgver)
b2sums=('b2b1aeed3b273b2a18a18835b6124ad1812ef4f7a1b58bd10508f1e62b1fddee384f16ac8e17bd22656a1f38e80002dacb8b26fe7eb46948c0fc4d2129f85bb7')

build() {
    cd $_pkgname
    python -m build --wheel --no-isolation
}

check() {
    cd $_pkgname
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    test-env/bin/python -P -m pytest -o addopts="" -v test
}

package() {
    cd $_pkgname
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
