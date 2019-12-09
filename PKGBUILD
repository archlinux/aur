# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-aer
pkgname=python-${_pkgname}
pkgver=0.3.4
pkgrel=1
pkgdesc="A high performance simulator for quantum circuits that includes noise models"
arch=('x86_64')
url="https://github.com/Qiskit/qiskit-aer"
license=('Apache')
depends=(
    'python-qiskit-terra'
    'cython'
    'openblas'
)
makedepends=(
    'python-setuptools'
    'cmake'
    'python-scikit-build'
    'ninja'
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Qiskit/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('bb5a293a5627f2312784ee6301815da7334886e15b62c5af1b86f3965124ba86')

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    # Avoid python setup.py build to download cmake from PyPi
    sed -i "s/'cmake'\, //" setup.py
}

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
