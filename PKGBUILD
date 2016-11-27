# Maintainer: Quentin Bourgeois <quentin+archlinux@bourgeois.eu>
#
# TODO: * review the different *-requirements.txt files
_pylibname=viivakoodi
pkgname=("python2-$_pylibname" "python-$_pylibname")
pkgver=0.8.0
pkgrel=1
pkgdesc='Barcode generator for Python. Fork of pyBarcode project.'
arch=('x86_64')
url="https://github.com/kxepal/$_pylibname"
license=('MIT')
optdepends=('inkscape: open barcode generated in SVG format')
source=("$_pylibname-$pkgver.tar.gz::https://github.com/kxepal/$_pylibname/archive/$pkgver.tar.gz")
sha256sums=('e1a17dc24975d5242202cfbb7534d69dd14eeb26bdf8a10f056c7b04904fef1e')

check() {
    cd "$srcdir/$_pylibname-$pkgver"
    
    for py_int in python3 python2; do
        msg "Testing $_pylibname-$pkgver with $py_int"
        "$py_int" ./test.py
    done
}

package_python-viivakoodi() {
    depends+=('python')
    makedepends+=('python-setuptools')
    provides+=('python2-viivakoodi')
    optdepends+=('python-pillow: render barcodes as images'
                 'python-recommonmark: for building the project documentation'
                 'python-semantic_version: for building the project documentation'
                 'python-sphinx: for building the project documentation'
                 'python-sphinx-alabaster-theme: for building the project documentation')
    checkdepends+=('python-pylint'
                   'python-pytest'
                   'python-pytest-cov'
                   'python-pytest-pep8'
                   'python-pytest-xdist'
                   'python-mock'
                   'python-tox')
    cd "$srcdir/$_pylibname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1

    if [ -f LICENSE ]; then
        install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
        install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.launcher"
    else
        warning "license file not found"
    fi
}

package_python2-viivakoodi() {
    depends+=('python2')
    makedepends+=('python2-setuptools')
    provides+=('python2-viivakoodi')
    optdepends+=('python2-pillow: render barcodes as images'
                 'python2-recommonmark: for building the project documentation'
                 'python2-sphinx: for building the project documentation'
                 'python2-sphinx-alabaster-theme: for building the project documentation')
    checkdepends+=('python2-pylint'
                   'python2-pytest'
                   'python2-pytest-cov'
                   'python2-pytest-xdist'
                   'python2-mock'
                   'python2-tox') 

    cd "$srcdir/$_pylibname-$pkgver"
    python2 setup.py install --root="$pkgdir/" --optimize=1

    if [ -f LICENSE ]; then
        install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
        install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.launcher"
    else
        warning "license file not found"
    fi
}
