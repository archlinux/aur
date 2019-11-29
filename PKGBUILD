# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-aer
pkgname=python-${_pkgname}
pkgver=0.3.3
pkgrel=2
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
sha256sums=('b38030fe49fa9695fb7342ea5a0ffbd63bc1052e38cfc051b277f92754cfb958')

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
