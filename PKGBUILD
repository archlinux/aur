# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit
pkgname=python-${_pkgname}
pkgver=0.35.0
pkgrel=1
pkgdesc="An open-source SDK for working with quantum computers at the level of circuits, algorithms, and application modules"
arch=('x86_64')
url="https://github.com/Qiskit/qiskit"
license=('Apache')
depends=(
    'python-qiskit-terra'
    'python-qiskit-aer'
)
optdepends=(
    'python-matplotlib: plotting support'

)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
checkdepends=(
    'python-pytest'
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Qiskit/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('164d9b70f5c2283c155081dcfc902a47051e73cd20bdf12220f12f66af0e7032')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

#check() {
#    cd "${srcdir}/${_pkgname}-${pkgver}"
#    python -m pytest test
#}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
