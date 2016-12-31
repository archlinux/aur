# Maintainer James W. Barnett <jbarnet4 at tulane dot edu>
pkgname=python2-pymbar-git
pkgver=r443.0b49250
pkgrel=1
pkgdesc="Python implementation of the multistate Bennett acceptance ratio (MBAR) method for estimating expectations and free energy differences. "
arch=('i686' 'x86_64')
url="https://github.com/choderalab/pymbar"
license=('LGPL')
depends=('python2' 'python2-numpy' 'python2-scipy' 'python2-six')
makedepends=('git' 'python2-nose' 'python2-statsmodels')
source=('git://github.com/choderalab/pymbar.git')
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/pymbar"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/pymbar"
    python2 setup.py build
}

check() {
    
    cd "$srcdir/pymbar"
    nosetests2 ./pymbar
}

package() {
    cd "$srcdir/pymbar"
    python2 setup.py install -O2 --root=$pkgdir || return 1
}
