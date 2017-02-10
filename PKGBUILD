# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python-glmnet')
pkgver=1.0.0.r18.g1e63abd
pkgrel=1
pkgdesc="A Python port of the glmnet package."
url="https://github.com/civisanalytics/python-glmnet"
makedepends=(
    'gcc-fortran'
    'python'
    'python-numpy')
license=('GPL2' 'BSD')
arch=('i686' 'x86_64')
source=("git+https://github.com/civisanalytics/python-glmnet.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    export LDFLAGS="$LDFLAGS -shared"
    cd "${srcdir}/${pkgname}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
