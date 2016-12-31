# Maintainer James W. Barnett <jbarnet4 at tulane dot edu>
pkgname=python-pymbar-git
pkgver=r453.dc0fd3f
pkgrel=1
pkgdesc="Python implementation of the multistate Bennett acceptance ratio (MBAR) method for estimating expectations and free energy differences. "
arch=('i686' 'x86_64')
url="https://github.com/choderalab/pymbar"
license=('LGPL')
depends=('python' 'python-numpy' 'python-scipy' 'python-six')
makedepends=('git' 'python-nose' 'python-statsmodels')
source=('git://github.com/choderalab/pymbar.git')
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/pymbar"
    git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/pymbar"
    python setup.py build
}

check() {
    cd "$srcdir/pymbar"
    nosetests ./pymbar
}

package() {
    cd "$srcdir/pymbar"
    python setup.py install -O2 --root=$pkgdir || return 1
}
