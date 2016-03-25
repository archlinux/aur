# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=kicost
pkgver=0.1.21
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
sha512sums=('1734f8efcb0614e58c200ab4bd6c513d5d663c140b42b3e6c86a5168cfa839dc03a25b70d6e652796006135ef1ebbb8942b30cdaec29c44586fb6560d8d416bd')

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

