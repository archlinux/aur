pkgname=python-brother_ql
pkgver=1.4a0
pkgrel=2
pkgdesc="Python package for the raster language protocol of the Brother QL series label printers"
url="https://github.com/matmair/brother_ql-inventree"
depends=('python' 'python-attrs' 'python-click' 'python-packbits' 'python-pillow>=3.3.0')
optdepends=('python-pyusb')
makedepends=('python-setuptools')
license=('GPL-3.0')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/b/brother_ql-inventree/brother_ql_inventree-$pkgver.tar.gz"
       "fix_pandoc.patch")
sha256sums=('be13019389962f09ab9d2b1366b55e080336905390261adcaa8f3ab75f937e3b'
            'c7478997c52851439b81cb81db5cb6221f3c367aba9ca4ff787390d20fe4d1e7')

prepare() {
    cd "$srcdir/brother_ql_inventree-$pkgver"
    patch -Np1 -i ../fix_pandoc.patch
}

build() {
    cd "$srcdir/brother_ql_inventree-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/brother_ql_inventree-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
