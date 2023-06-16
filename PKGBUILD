# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-dynamics
pkgname=python-${_pkgname}
pkgver=0.4.1
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
b2sums=('a4440143ea709d92ff0e5bf034eaa19ff070244692be2bf5447d386f12e02dcace744ba51babba9d40e6033f75c1d7d3ad37c9232c1b97652b992b5ff8c689fd')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
