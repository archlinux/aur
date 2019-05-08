# Maintainer: Nicolas Pouillard <nicolas.pouillard@gmail.com>
# Contributor: Peter Simons <simons@cryp.to>

pkgname=pyutil
pkgver=3.2.0
pkgrel=1
pkgdesc="general-purpose python library (used by tahoe-lafs)"
arch=('any')
url='https://pypi.python.org/pypi/pyutil'
license=('GPL2')
depends=('python2' 'python2-simplejson' 'zbase32')
makedepends=('python2-setuptools')
checkdepends=('python2-twisted' 'python2-mock')
source=("https://files.pythonhosted.org/packages/source/p/pyutil/pyutil-${pkgver}.tar.gz")
sha256sums=('910b83e70d83a6d44d5c44613c524725faeb55d297aeb3bd7623a16743689d1c')

build(){
    cd "$srcdir/pyutil-$pkgver"
    python2 setup.py build
}

BUILDENV+=(!check)
check() {
    cd "$srcdir/pyutil-$pkgver"
    python2 setup.py test
}

package(){
    cd "$srcdir/pyutil-$pkgver"
    python2 setup.py install --root="$pkgdir" --prefix='/usr' --optimize=1 --skip-build
    rm -r "$pkgdir/usr/pyutil"
}
