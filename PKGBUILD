# Maintainer: Nicolas Pouillard <nicolas.pouillard@gmail.com>
# Contributor: Peter Simons <simons@cryp.to>

pkgname=pyutil
pkgver=3.1.0
pkgrel=2
pkgdesc="general-purpose python library (used by tahoe-lafs)"
arch=('any')
url='https://pypi.python.org/pypi/pyutil'
license=('GPL2')
depends=('python2' 'python2-simplejson' 'zbase32')
makedepends=('python2-setuptools')
checkdepends=('python2-twisted' 'python2-mock')
source=("https://files.pythonhosted.org/packages/source/p/pyutil/pyutil-${pkgver}.tar.gz")
sha256sums=('8e254aa0a3b59e90515f7bca7ebc467b20a8d3fd2e26b63d196655c075da8d38')

build(){
    cd "$srcdir/pyutil-$pkgver"
    python2 setup.py build
}

#BUILDENV+=(!check)
check() {
    cd "$srcdir/pyutil-$pkgver"
    python2 setup.py test
}

package(){
    cd "$srcdir/pyutil-$pkgver"
    python2 setup.py install --root="$pkgdir" --prefix='/usr' --optimize=1 --skip-build
    rm -r "$pkgdir/usr/pyutil"
}
