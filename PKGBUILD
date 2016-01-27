# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=kicost
pkgver=0.1.16
pkgrel=1
pkgdesc="KiCAD script to convert BOM xml into spreadsheet"
url="https://github.com/xesscorp/KiCost/"
makedepends=('python2-setuptools')
depends=('python2'
         'python2-beautifulsoup4'
         'python2-xlsxwriter'
         'python2-future'
         'python2-lxml'
         'python2-yattag'
)
optdepends=()
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/k/${pkgname}/${pkgname}-${pkgver}.zip")
sha512sums=('de2e9188b52cee6eb1eb60c4c46403d05b1cd4fb5dee5728422a68448e64575f7d44437fc1abafd8167ec0f73a3afea89293e9b6d6e0c919387082c8ffc20823')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    # Trivial python 2to3 conversion is a lost cause
    #2to3 -w .

    #sed -ie 's:^#\! /usr/bin/python$:#! /usr/bin/env python2:' b2

    python2 setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1 
    rm -rf ${pkgdir}/usr/lib/python*/site-packages/tests
}

