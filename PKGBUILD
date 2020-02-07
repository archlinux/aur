pkgname=screenplain
pkgver=0.8.0
pkgrel=2
pkgdesc='Fountain parser with FDX, HTML and PDF backends'
arch=('any')
url='http://www.screenplain.com/'
license=('MIT')
depends=('python' 'python-six')
makedepends=('python-setuptools')
optdepends=('python-reportlab: PDF backend support')
source=(
    "https://github.com/vilcans/screenplain/archive/${pkgver}.tar.gz"
    "use-html-escape.patch"
)
sha256sums=(
    'aef5e50bf4ea072c3d3a9384b66fe34a40e8d2d55ed226624aaabc226cec0d9a'
    '7e1dbedec236c2089dc50e236b03479b82b7581d311a2f9b8118a7b9e151db8d'
)

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -p1 < ../../use-html-escape.patch
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}"
    install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}
