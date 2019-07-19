# Contributor: Peter Simons <simons@cryp.to>
# Contributor: Nicolas Pouillard <nicolas.pouillard@gmail.com>

pkgbase=zbase32
pkgname=('python2-zbase32' 'python-zbase32')
pkgver=1.1.5
pkgrel=3
pkgdesc="An alternate base32 encoder (not RFC 3548 compliant)"
arch=('any')
url='https://pypi.python.org/pypi/zbase32'
license=('BSD')
makedepends=('python2-setuptools' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/z/zbase32/zbase32-${pkgver}.tar.gz"
        'LICENSE')
sha256sums=('9b25c34ba586cbbad4517af516e723599a6f38fc560f4797855a5f3051e6422f'
            'c341afeb154cdcf20c247c8289fadd82245c89d0ea40b630c98885481c29845f')

prepare() {
    cp -a "zbase32-$pkgver"{,-py2}
}

build() {
    cd "$srcdir/zbase32-$pkgver-py2"
    python2 setup.py build

    cd "$srcdir/zbase32-$pkgver"
    2to3 -wn -j 4 .
    python setup.py build

}

package_python2-zbase32() {
    cd "$srcdir/zbase32-$pkgver-py2"
    replaces=('zbase32')
    python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm 644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python-zbase32() {
    cd "$srcdir/zbase32-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm 644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
