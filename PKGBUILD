# Maintainer: pfm <vorticity at mail dot ru>
pkgname=("python-eliot" "python2-eliot")
_pkgname=eliot
pkgver=1.7.0
pkgrel=1
pkgdesc="Logging that tells you why it happened"
arch=(any)
url="https://eliot.readthedocs.io"
license=('Apache')
makedepends=("python-setuptools" "python2-setuptools")
source=("$_pkgname-$pkgver.tar.gz::https://github.com/itamarst/$_pkgname/archive/$pkgver.tar.gz")
md5sums=('4e6b19965861245bd7dd2c1a7ad17bb4')

prepare() {
    cp -a $_pkgname-$pkgver{,-py2}
}

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build

    cd "$srcdir/$_pkgname-$pkgver-py2"
    python2 setup.py build
}

package_python-eliot() {
    depends=("python")
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

package_python2-eliot() {
    depends=("python2")
    cd "$srcdir/$_pkgname-$pkgver-py2"
    python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
