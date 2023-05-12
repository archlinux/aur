# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-experiments
pkgname=python-${_pkgname}
pkgver=0.5.2
pkgrel=1
pkgdesc="Qiskit Experiments package for IBM qiskit framework"
arch=('any')
url="https://github.com/Qiskit/qiskit-experiments"
license=('Apache')
depends=(
    'python-lmfit'
    'python-matplotlib'
    'python-numpy'
    'python-qiskit-ibm-experiment'
    'python-qiskit-terra'
    'python-scipy'
    'python-uncertainties'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Qiskit/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('1c59139b67e0d19500329d684ba9333169279152f9419f72ac1611cfde51ee714c4a06679bd5ea07d8dc739f92d755094654543c11ba728780049ec376e803ac')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
