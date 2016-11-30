# Maintainer: Quentin Bourgeois <quentin+archlinux@bourgeois.eu>

pkgbase=viivakoodi
pkgname=("python2-$pkgbase" "python-$pkgbase")
pkgver=0.8.0
pkgrel=1
pkgdesc='Barcode generator for Python. Fork of pyBarcode project.'
arch=('any')
url="https://github.com/kxepal/$pkgbase"
license=('MIT')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('e1a17dc24975d5242202cfbb7534d69dd14eeb26bdf8a10f056c7b04904fef1e')
makedepends=('python-setuptools'
             'python2-setuptools')

check() {
    cd "$srcdir/$pkgbase-$pkgver"
    
    for py_int in python3 python2; do
        msg "Testing $pkgbase-$pkgver with $py_int"
        "$py_int" ./test.py
    done
}

package_python-viivakoodi() {
    depends=('python'
             'python-setuptools')
    optdepends=('python-pillow: render barcodes as images')
    checkdepends=('python-pytest'
                  'python-mock'
                  'python-tox')
    cd "$srcdir/$pkgbase-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.launcher"
}

package_python2-viivakoodi() {
    depends=('python2'
             'python2-setuptools')
    optdepends=('python2-pillow: render barcodes as images')
    checkdepends=('python2-pytest'
                  'python2-mock'
                  'python2-tox') 

    cd "$srcdir/$pkgbase-$pkgver"
    python2 setup.py install --root="$pkgdir/" --optimize=1

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.launcher"
}
