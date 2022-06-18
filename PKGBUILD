# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-optimization
pkgname=python-${_pkgname}
pkgver=0.3.2
pkgrel=2
pkgdesc="Quantum Optimization package for IBM qiskit framework"
arch=('x86_64')
url="https://github.com/Qiskit/qiskit-optimization"
license=('Apache')
depends=(
    'python-docplex'
    'python-networkx'
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
checkdepends=(
    'python-qiskit-aer'
    'python-ddt'
    'python-pytest'
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Qiskit/${_pkgname}/archive/${pkgver}.tar.gz")
b2sums=('aa840a1413f6205f9edca4c63a34ea3ad88bc9a3b7e86297b8801f4ebc9fcceec259ec905ef13e118b2c489f5eb2e6d17178642234184b060c1082ad4e56228f')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

#check() {
#    cd "${srcdir}/${_pkgname}-${pkgver}"
#    python -m pytest test/
#}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
