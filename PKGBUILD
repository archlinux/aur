# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-gym
pkgname=python-${_pkgname}
pkgver=0.4.2
pkgrel=1
pkgdesc="Quantum information science problems formulated as reinforcement learning environments"
arch=(x86_64)
url=https://github.com/AI4quantum/qiskit-gym
license=(Apache-2.0)
depends=(
    python-gymnasium
    python-qiskit
    python-twisterl
)
makedepends=(
    git
    python-build
    python-installer
    python-maturin
)
source=($_pkgname::git+https://github.com/AI4quantum/$_pkgname#tag=$pkgver)
b2sums=('ddff8e615637b7a5d8eac67b9f2b7d310aae8bb5e1e3b8ebd28b69da9616aac4af62808fe068e20d328c18711e27fe9ee71f0fdcb599a9955e5e99397cfb8cb1')

build() {
    cd $_pkgname
    python -m build --wheel --no-isolation
}

package() {
    cd $_pkgname
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
