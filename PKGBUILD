# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-experiments
pkgname=python-${_pkgname}
pkgver=0.3.1
pkgrel=1
pkgdesc="Qiskit Experiments package for IBM qiskit framework"
arch=('x86_64')
url="https://github.com/Qiskit/qiskit-experiments"
license=('Apache')
depends=(
    'python-uncertainties'
    'python-matplotlib'
    'python-numpy'
    'python-qiskit-ibmq-provider'
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
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Qiskit/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('e73472462ae549fca665fc318c435eb9d63060ddf3c1a3c5169b31015578a1c3caaea34bd0726f69e857ab820c9b33a78368738aa3d6852cd758639a29e077e3')

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
