# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=kicost
_pkgname=KiCost
pkgver=1.1.18
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
sha512sums=('442cd84024a6ddaa1bfc5a85e16011c2c3e2b55d09497d87ac04b378e99ec88cb36c278348e5220e4520fbf134396b23994d28287a382d94454cbca18c4facaa')

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

