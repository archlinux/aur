pkgname='python-diffcp'
_module='diffcp'
pkgver='1.0.21'
pkgrel=1
pkgdesc="Differentiating through a cone program"
url="http://github.com/cvxgrp/diffcp/"
depends=('python-ecos' 'python-multiprocess' 'python-numpy' 'python-scs' 'python-scipy' 'python-threadpoolctl')
makedepends=('pybind11')
optdepends=()
checkdepends=('python-pytest')
license=('Apache')
arch=('x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cvxgrp/diffcp/archive/v${pkgver}.tar.gz")
sha256sums=('9451634ffd2f796a17a707c20b176f05678e4a7c362965c23ddec3a815258ceb')

build() {
    cd "${_module}-${pkgver}"
    MARCH_NATIVE=1 python setup.py build
}

package() {
    cd "${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

check() {
    cd "${_module}-${pkgver}"
    python setup.py build_ext --inplace
    PYTHONPATH=. pytest tests
}
