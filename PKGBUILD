# Maintainer: Ahmed Allibhoy aallibho@eng.ucsd.edu

pkgname=python-disropt-git
pkgver=r35.ea9d7b4
pkgrel=1
pkgdesc="Python Framework for Distributed Optimization"
arch=('x86_64')
url="https://disropt.github.io/disropt/"
license=('GPL3')
source=("git+https://github.com/DISROPT/disropt")
sha256sums=('SKIP')
makedepends=('git')

pkgver() {
    cd ${srcdir}/disropt
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${srcdir}/disropt
    python setup.py build
}

package() {
    depends=('python-numpy' 'python-scipy' 'python-mpi4py' 'python-autograd')
    optdepends=('python-osqp' 'python-cvxopt' 'python-cvxpy')
    cd ${srcdir}/disropt
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
