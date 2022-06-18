# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-finance
pkgname=python-${_pkgname}
pkgver=0.3.2
pkgrel=1
pkgdesc="Quantum Finance package for IBM qiskit framework"
arch=('x86_64')
url="https://github.com/Qiskit/qiskit-finance"
license=('Apache')
depends=(
    'python-fastdtw'
    'python-numpy'
    'python-pandas'
    'python-psutil'
    'python-qiskit-optimization'
    'python-qiskit-terra'
    'python-quandl'
    'python-scikit-learn'
    'python-scipy'
    'python-yfinance'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
checkdepends=(
    'python-qiskit-aer'
    'python-certifi'
    'python-ddt'
    'python-pytest'
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Qiskit/${_pkgname}/archive/${pkgver}.tar.gz")
b2sums=('ac24dd982e8d9c98450d0b571c54b759c30100fa956316da598b40e3e4e599934b05919b6b2f52b2723c07bc643fb0a60f355b751f7bea6f9031813f42e608e3')

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
