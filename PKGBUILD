# Maintainer: Pieter Lenaerts <pieter.lenaerts@outlook.be>
pkgname=eml2pdf
pkgver=0.1.1
pkgrel=1
pkgdesc="Convert .eml (email) files to PDF using Python and Pango."
arch=(any)
url="https://github.com/plenaerts/eml2pdf"
license=('MIT')
depends=('python-weasyprint' 'python-beautifulsoup4' 'python-markdown'
        'python-hurry-filesize')
makedepends=('python-build' 'python-installer' 'python-wheel'
        'python-setuptools-scm' 'git')
replaces=('eml_to_pdf-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/plenaerts/eml2pdf/archive/${pkgver}.tar.gz")
sha256sums=('29f3630db4b9a1b64430644c8817c4f10bfd2b613870786ccbf72b56790a0c82')

build() {
    SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
