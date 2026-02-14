# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-gym
pkgname=python-${_pkgname}
pkgver=0.4.1
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
b2sums=('6063c92c95a5fe1d9208c8e7dd17d96c022d31e60dab63d8c868310cbe3e4526dd6032696d6c61b99f9bc42b289cc95f4fb322df4a346d6545dfb59f13a8a97e')

build() {
    cd $_pkgname
    python -m build --wheel --no-isolation
}

package() {
    cd $_pkgname
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
