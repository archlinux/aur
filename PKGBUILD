# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-nature
pkgname=python-${_pkgname}
pkgver=0.4.1
pkgrel=1
pkgdesc="Quantum Nature package for IBM qiskit framework"
arch=('x86_64')
url="https://github.com/Qiskit/qiskit-nature"
license=('Apache')
depends=(
    'python-h5py'
    'python-numpy'
    'python-psutil'
    'python-qiskit-terra'
    'python-retworkx'
    'python-scikit-learn'
    'python-scipy'
    'python-typing_extensions'
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
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Qiskit/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('bf73ae175cb8bc767062ffd09bb49f8b9e70d8ae4017834448e43fa85f2ef3328cf7260342c47683f810a3fffc94fb21972d128c0a191f4eb5567c55e55d2b1d')

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
