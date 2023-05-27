# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=kicost
_pkgname=KiCost
pkgver=1.1.17
pkgrel=1
pkgdesc="KiCAD script to convert BOM xml into spreadsheet"
url="https://github.com/xesscorp/KiCost/"
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel'
            )
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
sha512sums=('2af1e62554d09ba31b68607a9425b37db85ecc92500775bb889debe318c7767cdc0b7b145ee58958b2fc747fc5b2265383f2184434708705bc0f414b8b80fb74')

prepare() {
    cd "$srcdir/$_pkgname-$pkgver"
}

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    rm -rf ${pkgdir}/usr/lib/python*/site-packages/tests
}

