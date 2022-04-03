# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=python-constraint
pkgver=1.4.0
pkgrel=5
pkgdesc="Module implementing support for handling CSPs (Constraint Solving Problems) over finite domain"
arch=('x86_64')
url="https://github.com/python-constraint/python-constraint"
license=('custom:BSD')
depends=('python')
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('6f38f4e7b07e7479ae77ad7dec00293189faa5885650defabf48f34875824c5d')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}


package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
    #Delete example folder to avoid conflict files with python-cvxpy
    rm -r "${pkgdir}/usr/lib/python3.10/site-packages/examples"
}
