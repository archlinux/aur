# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-dynamics
pkgname=python-${_pkgname}
pkgver=0.4.3
pkgrel=1
pkgdesc="Tools for building and solving models of quantum systems in Qiskit"
arch=('x86_64')
url="https://github.com/Qiskit-Extensions/qiskit-dynamics"
license=('Apache')
depends=(
    'python-matplotlib'
    'python-multiset'
    'python-numpy'
    'python-qiskit'
    'python-scipy'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Qiskit-Extensions/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('0b9f995d289d1b4591d05bad6ae3db2aa7c81b4f4e62e23b264519b401fba00629402027160c413fb1fc0edcd75156617595d5fa0f79a878d05f295913978070')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
