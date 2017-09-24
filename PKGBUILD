# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=kicost
pkgver=0.1.36
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
         'python2-tqdm'
)
optdepends=()
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/5c/f9/b61a9d11905868d36a92d76ff9ba5f9e92b441d6d2eeca4a6989ff28e7dd/${pkgname}-${pkgver}.tar.gz")
sha512sums=('52c76b92e515717d9431b22670087e1c0c9027f2e6b53dad508970628b3c43baeac4a8763be43eccc2840a13001e92d51fe391f137a4396f96786343e1a96a4b')

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

