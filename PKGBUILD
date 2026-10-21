# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-paulice
pkgname=python-${_pkgname}
pkgver=0.2.1
pkgrel=1
pkgdesc="Embedding spacetime Pauli checks into Clifford circuits"
arch=(x86_64)
url=https://github.com/Qiskit/qiskit-paulice
license=(Apache-2.0)
depends=(
    python-numpy
    python-qiskit
    python-qiskit-aer
)
makedepends=(
    git
    python-build
    python-installer
    python-maturin
)
checkdepends=(
    python-pytest
    python-qiskit-ibm-runtime
)
source=($_pkgname::git+https://github.com/Qiskit/$_pkgname#tag=$pkgver)
b2sums=('b82b294922cade06e10f6de968522e2fc48d36dd7fc1e933032b3a03f171691ccf912aaa03e28e1f3f5a602f169fc167261ede5e9ae194f97c1774fc9c8e214b')

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
