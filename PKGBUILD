pkgname='python-cvxpy'
_module='cvxpy'
pkgver='1.2.0'
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
checkdepends=('glpk' 'python-pytest' 'python-cvxopt' 'python-osqp' 'python-scs')
license=('Apache')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cvxgrp/cvxpy/archive/v${pkgver}.tar.gz")
sha256sums=('3ec27be2a8137c40aba90087e7486436896f6547453b22252ef29e49eddb6fbf')

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
