# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=kicost
_pkgname=KiCost
pkgver=1.1.20
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
sha512sums=('6294b5b92c9a94a22a9ff6243917cff7979e7a38c5187635582e7eaff16658522b5b6afea6c8a4adfd6e035f6839cefcb98bea985de7e6aecd5dcaed3697b348')

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

