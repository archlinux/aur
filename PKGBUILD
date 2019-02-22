# Maintainer: pfm <vorticity at mail dot ru>
pkgname=("python-txacme" "python2-txacme")
_pkgname=txacme
pkgver=0.9.2
pkgrel=1
pkgdesc="ACME protocol implementation for Twisted"
arch=(any)
url="https://txacme.readthedocs.io"
license=('MIT')
makedepends=("python-setuptools" "python2-setuptools")
source=("https://github.com/twisted/$_pkgname/archive/$pkgver.tar.gz")
md5sums=('ec9591dd60cc64b4504df1c9b8785e98')

prepare() {
    cp -a $_pkgname-$pkgver{,-py2}
}

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build

    cd "$srcdir/$_pkgname-$pkgver-py2"
    python2 setup.py build
}

package_python-txacme() {
    depends=("python")
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

package_python2-txacme() {
    depends=("python2")
    cd "$srcdir/$_pkgname-$pkgver-py2"
    python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
