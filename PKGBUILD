# Maintainer: Harriet O'Brien <harrietobrien@protonmail.com>

pkgname=python-e3nn
_pkgname=e3nn
pkgver=0.6.0
pkgrel=1
pkgdesc="Euclidean neural networks for E(3) equivariant deep learning"
arch=('any')
url="https://github.com/e3nn/e3nn"
license=('MIT')
depends=(
    'python>=3.8'
    'python-pytorch'
    'python-scipy'
    'python-sympy'
    'python-opt-einsum-fx'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/e3nn/e3nn/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('6be2d0cd59d1e76d8db8d2c6252d72604fb152c4be0212c6116a22e9f0018dc5')

build() {
    cd "${_pkgname}-${pkgver}"
    /usr/bin/python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    /usr/bin/python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
