# Contributor: Doron Behar <doron.behar@gmail.com>
# Maintainer: hexchain <i@hexchain.org>

_name=bashlex
pkgname=python-bashlex
pkgver=0.15
pkgrel=1
pkgdesc="Python port of the parser used internally by GNU bash"
arch=('any')
url="https://github.com/idank/bashlex"
license=('GPL3')
depends=('python')
makedepends=('perl')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('8cc3cea45f812c1d7d59f09411eba38f1d97a26a76736062ff6b5bab723fb6e8')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -c 'import bashlex'
    perl -i -fpe "s|\\Q$srcdir/$_name-$pkgver\\E||g" bashlex/parsetab.py
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
