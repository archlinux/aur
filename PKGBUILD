pkgname='python-cvxpy'
_module='cvxpy'
pkgver='1.1.14'
pkgrel=1
pkgdesc="A domain-specific language for modeling convex optimization problems"
url="http://github.com/cvxgrp/cvxpy/"
depends=(
    'python'
    'python-ecos'
    'python-fastcache'
    'python-multiprocess'
    'python-numpy'
    'python-scipy'
    'python-toolz')
makedepends=('python-setuptools')
optdepends=('python-diffcp' 'python-cvxopt' 'python-osqp' 'python-scs')
checkdepends=('python-pytest' 'python-cvxopt' 'python-osqp' 'python-scs')
license=('Apache')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cvxgrp/cvxpy/archive/v${pkgver}.tar.gz")
sha256sums=('cdd94615af52970ba82bd2e44751c90cb5db6820b89a15541ac4b4714855c289')

build() {
    cd "${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

check() {
    cd "${_module}-${pkgver}"
    python setup.py build_ext --inplace
    pytest cvxpy/tests
}
