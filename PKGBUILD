# Maintainer: Nathan Monfils <nathan.monfils@hotmail.fr>

pkgname=python2-revdb-hg
pkgver=r48.f34e846835e3
pkgrel=1
pkgdesc="RevDB, the Reverse Debugger"
arch=(any)
url="https://bitbucket.org/pypy/revdb"
license=('UNKNOWN')
depends=('pypy2-revdb')
makedepends=(python2-setuptools mercurial)
provides=("${pkgname%-hg}")
conflicts=("${pkgname%-hg}")
source=("${pkgname}::hg+https://bitbucket.org/pypy/revdb")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname}"
    printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
    cd "$srcdir/${pkgname}"
    python2 setup.py build
}

package() {
    cd "$srcdir/${pkgname}"
    python2 setup.py install --skip-build -O1 --root="$pkgdir"
    rm -rf "$pkgdir"/usr/lib/python*/site-packages/tests
}

