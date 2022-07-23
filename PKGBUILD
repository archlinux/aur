# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=kicost
_pkgname=KiCost
pkgver=1.1.10
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/xesscorp/KiCost/archive/v$pkgver.tar.gz"
        "0001-Fixed-problems-when-trying-to-use-Digi-Key-API-but-n.patch")
sha512sums=('d38242f2e482d9f58a89c361ba6252c1f633a4004d9be92900f9a8abde0f961d387e5b3c7f9a88dffe49525614f4aaee2e45df02fc176ca534927e99f2b24f71'
            '609345567334474becab7fd1948ae7acea6dd032e2270e94433aad7d9ffabbb304b8ae7513e81888fea6fc664f284c0114967842bb6671f8ed37bd862f7c8ead')

prepare() {
    cd "$srcdir/$_pkgname-$pkgver"
    patch --forward --strip=1 --input="${srcdir}/0001-Fixed-problems-when-trying-to-use-Digi-Key-API-but-n.patch"
}

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
    rm -rf ${pkgdir}/usr/lib/python*/site-packages/tests
}

