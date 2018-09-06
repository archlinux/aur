# Maintainer: Ainola

pkgbase=python-vipaccess
pkgname=('python-vipaccess' 'python2-vipaccess')
pkgver=0.9.0
pkgrel=1
pkgdesc="A free software implementation of Symantec's VIP Access application and protocol."
arch=('any')
url="https://github.com/dlenski/python-vipaccess"
license=('Apache')
makedepends=('python-setuptools' 'python-nose' 'python2-setuptools' 'python2-nose')
source=("https://github.com/dlenski/python-vipaccess/archive/v$pkgver.tar.gz")
sha256sums=('0a432d5f8bc8920a7adb9624f40ff8bd25a9f326bb1264462ad048faa6758c88')

prepare() {
    cp -a "$pkgname-$pkgver"{,-py2}
}

build() {
    cd "$srcdir/python-vipaccess-$pkgver"     && python setup.py build
    cd "$srcdir/python-vipaccess-$pkgver-py2" && python2 setup.py build
}

check() {
    cd "python-vipaccess-$pkgver"        && python setup.py test
    cd "../python-vipaccess-$pkgver-py2" && python2 setup.py test
}

package_python-vipaccess() {
    depends=('python-pycryptodome' 'python-lxml' 'python-oath' 'python-requests')
    cd "python-vipaccess-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
package_python2-vipaccess() {
    depends=('python2-pycryptodome' 'python2-lxml' 'python2-oath' 'python2-requests')
    cd "python-vipaccess-$pkgver-py2"
    python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
