# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-dynamics
pkgname=python-${_pkgname}
pkgver=0.4.0
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
b2sums=('544e3af89f1f41bb64e4884de7c2466f21012e33a5651557661fb58f7144335240c8836f65290bb00411dd43cf4a57381928db493a419185a67e96d1f745959c')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
