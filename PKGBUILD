pkgname=screenplain
pkgver=0.12.0
pkgrel=1
pkgdesc='Fountain parser with FDX, HTML and PDF backends'
arch=('any')
url='http://www.screenplain.com/'
license=('MIT')
depends=('python' 'python-six')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=('python-reportlab: PDF backend support')
source=(
    "https://github.com/vilcans/screenplain/archive/${pkgver}.tar.gz"
)
sha256sums=('4e601c44ef2f395d0ab4614ee3a62015e713183545502fba5b54670faee9f3e7')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
