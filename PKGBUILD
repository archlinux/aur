# Maintainer: Ian Denhardt <ian@zenhack.net>

_pkgname=urwidtrees
pkgname=python2-$_pkgname
pkgver=1.0
pkgrel=1
pkgdesc="tree widgets for urwid"
arch=(any)
url="https://github.com/pazz/$_pkgname"
license=(GPL3)
depends=('python2-urwid>=1.1.0')
makedepends=(python2-sphinx)
source=($_pkgname-$pkgver.tar.gz::https://github.com/pazz/$_pkgname/archive/$pkgver.tar.gz)

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python2 setup.py build
    make SPHINXBUILD=sphinx-build2 -C docs man html
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python2 setup.py install --optimize=1 --root="$pkgdir"
    install -dm755 "$pkgdir/usr/share/doc/$pkgname"
    cp -a docs/build/html/* "$pkgdir/usr/share/doc/$pkgname"
}
md5sums=('2ddf327db098caee70ff4648abba0209')
