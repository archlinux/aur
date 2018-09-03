# Maintainer: Ainola

pkgbase=python-oath
pkgname=('python-oath' 'python2-oath')
pkgver=1.4.0
pkgrel=4
pkgdesc="Python implementation of HOTP, TOTP and OCRA algorithms from OATH."
arch=('any')
url="https://github.com/bdauvergne/python-oath"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/bdauvergne/python-oath/archive/v$pkgver.tar.gz")
sha256sums=('3e485d0fc4a6c077cb75841cba6512c1ab1b11d766969a24b199586e04e7c58f')

prepare() {
    cp -a "python-oath-$pkgver"{,-py2}
}

build() {
    cd "$srcdir/python-oath-$pkgver"     && python setup.py build
    cd "$srcdir/python-oath-$pkgver-py2" && python2 setup.py build
}

package_python-oath() {
    cd "python-oath-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 doc/* -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_python2-oath() {
    cd "python-oath-$pkgver-py2"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 doc/* -t "$pkgdir/usr/share/doc/$pkgname/"
}
