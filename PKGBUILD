# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=kicost
pkgver=0.1.19
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
sha512sums=('e15910a84f48f3710484289d058ec66674666dbaf52305982fd13573a1b15b51873f93ecf139ff0ee343b76039b12e444d508c8ff92505ffd1f74fe61ab3abe8')

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

