# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=kicost
pkgver=0.1.42
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
         'python2-currencyconverter'
)
optdepends=()
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/c5/65/00353893a7ab185664bdc997fb0cff4a563f2e355fa9056dd2f32bba4f83/${pkgname}-${pkgver}.tar.gz")
sha512sums=('61bf2f7e8c544d7c0df89bda45ba2a04c5d08b59e8c6b0ad4790133cda7490aa9dbdc3755078358cd83b7475dbd0e704b3d8629f6f5ce7ce2863bdbe615ef0c9')

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

