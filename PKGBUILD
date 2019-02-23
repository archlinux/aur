# Maintainer: pfm <vorticity at mail dot ru>
pkgname=("python-txsni" "python2-txsni")
_pkgname=txsni
pkgver=0.1.9
pkgrel=1
pkgdesc="Simple support for running a TLS server with Twisted"
arch=(any)
url="https://github.com/glyph/txsni"
license=('MIT')
makedepends=("python-setuptools" "python2-setuptools")
source=("https://github.com/glyph/$_pkgname/archive/v$pkgver.tar.gz")
md5sums=('c647172765bc4f932b79d53268b8b124')

prepare() {
    cp -a $_pkgname-$pkgver{,-py2}
}

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build

    cd "$srcdir/$_pkgname-$pkgver-py2"
    python2 setup.py build
}

package_python-txsni() {
    depends=("python")
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_python2-txsni() {
    depends=("python2")
    cd "$srcdir/$_pkgname-$pkgver-py2"
    python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
