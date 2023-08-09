# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-dynamics
pkgname=python-${_pkgname}
pkgver=0.4.2
pkgrel=1
pkgdesc="Tools for building and solving models of quantum systems in Qiskit"
arch=('x86_64')
url="https://github.com/Qiskit/qiskit-dynamics"
license=('Apache')
depends=(
    'python-matplotlib'
    'python-multiset'
    'python-numpy'
    'python-qiskit-terra'
    'python-scipy'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Qiskit/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('25bf87fabc9c007c23e48bdfb676ae4a4afad74c9f5b51c2e2836929f51caf8140ac4edba2bc9bbf8099a0687d2f05ef69e23ea8f312043e6f13df7a20ce7326')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
