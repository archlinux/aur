# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-ibm-provider
pkgname=python-${_pkgname}
pkgver=0.8.0
pkgrel=1
pkgdesc="Qiskit Provider for accessing the IBM Quantum Services: Online Systems and Simulators"
arch=('any')
url="https://github.com/Qiskit/qiskit-ibm-provider"
license=('Apache')
depends=(
    'python-dateutil'
    'python-numpy'
    'python-qiskit'
    'python-requests'
    'python-requests-ntlm'
    'python-typing_extensions'
    'python-urllib3'
    'python-websocket-client'
    'python-websockets'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Qiskit/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('c46fccad6928a4b3f1ab042b5e2ab988be233031276cf2d0f10ac8a1e15fba1dda48f2694cb84909a675d4569237da0aa96aac03ad991e5bb8710429ca27b019')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
