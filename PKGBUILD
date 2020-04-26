# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-glmnet'
pkgver=2.1.1
pkgrel=1
pkgdesc="A Python port of the glmnet package"
url="https://github.com/civisanalytics/python-glmnet"
makedepends=(
    'gcc-fortran'
    'python'
    'python-numpy')
checkdepends=('python-pytest')
license=('GPL2' 'BSD')
arch=('x86_64')
source=("https://github.com/civisanalytics/python-glmnet/archive/v$pkgver.tar.gz")
sha256sums=('3516950c7c15496b94951c8ede61b55f304844d9957f68345112262fd2a5f28e')

build() {
    export LDFLAGS="$LDFLAGS -shared"
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

check() {
    cd "${pkgname}-${pkgver}"
    python setup.py build_ext --inplace
    PYTHONPATH=. pytest
}
