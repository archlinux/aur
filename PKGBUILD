# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=kicost
_pkgname=KiCost
pkgver=1.1.6
pkgrel=1
pkgdesc="KiCAD script to convert BOM xml into spreadsheet"
url="https://github.com/xesscorp/KiCost/"
makedepends=('python-setuptools')
depends=('python'
         'python-beautifulsoup4'
         'python-lxml'
         'python-xlsxwriter'
         'python-tqdm'
         'python-requests'
         'python-validators'
         'python-wxpython'
         'python-colorama'
)
optdepends=()
license=('MIT')
arch=('any')
# Pypi source is missing requirements.txt and setup.py fails :-/
#source=("https://pypi.python.org/packages/source/k/${pkgname}/${pkgname}-${pkgver}.tar.gz")
source=("$pkgname-$pkgver.tar.gz::https://github.com/xesscorp/KiCost/archive/v$pkgver.tar.gz")
sha512sums=('682281f54fbf9419effdd1991e9416d581e48dfc245b6b14bf6d82898a136b02500fb624cdc084fec719d3e48ee93764bcd1eb77e98ea6e047ff4c0c009897fa')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
    rm -rf ${pkgdir}/usr/lib/python*/site-packages/tests
}

