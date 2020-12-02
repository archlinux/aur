pkgname='python-diffcp'
_module='diffcp'
pkgver='1.0.15'
pkgrel=1
pkgdesc="Differentiating through a cone program"
url="http://github.com/cvxgrp/diffcp/"
depends=('python-ecos' 'python-numpy' 'python-scs' 'python-scipy' 'python-threadpoolctl')
makedepends=('pybind11')
optdepends=()
checkdepends=('python-pytest')
license=('Apache')
arch=('x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cvxgrp/diffcp/archive/v${pkgver}.tar.gz")
sha256sums=('f8ce6f4f502271995c2aa67793f9d79e0c426cdd49ce257290877c2ee5f36877')

build() {
    cd "${_module}-${pkgver}"
    MARCH_NATIVE=1 OPENMP_FLAGS="-fopenmp" python setup.py build
}

package() {
    cd "${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

check() {
    cd "${_module}-${pkgver}"
    python setup.py build_ext --inplace
    python tests.py
}
