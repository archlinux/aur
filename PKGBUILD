# Maintainer: Ainola

pkgbase=python-oath
pkgname=('python-oath' 'python2-oath')
pkgver=1.4.0
pkgrel=7
pkgdesc="Python implementation of HOTP, TOTP and OCRA algorithms from OATH."
arch=('any')
url="https://github.com/bdauvergne/python-oath"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=("$pkgname-$pkgver::https://github.com/bdauvergne/python-oath/archive/v$pkgver.tar.gz")
sha256sums=('3e485d0fc4a6c077cb75841cba6512c1ab1b11d766969a24b199586e04e7c58f')

prepare() {
    cp -a "python-oath-$pkgver"{,-py2}
}

build() {
    cd "python-oath-$pkgver"     && python setup.py build
    cd "../python-oath-$pkgver-py2" && python2 setup.py build
}

check() {
    cd "python-oath-$pkgver" && python setup.py test
    cd "../python-oath-$pkgver-py2" && python2 setup.py test
}

package_python-oath() {
    depends=('python')
    cd "python-oath-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 doc/* -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_python2-oath() {
    depends=('python2')
    cd "python-oath-$pkgver-py2"
    python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 doc/* -t "$pkgdir/usr/share/doc/$pkgname/"
}
