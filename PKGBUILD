# Maintainer: Pieter Lenaerts <pieter.lenaerts@outlook.be>
pkgname=eml2pdf
pkgver=2.1.0
pkgrel=1
pkgdesc="Convert .eml (email) files to PDF using Python and Pango."
arch=(any)
url="https://github.com/plenaerts/eml2pdf"
license=('MIT')
depends=('python-weasyprint' 'python-beautifulsoup4' 'python-markdown'
        'python-hurry-filesize')
checkdepends=('python-pytest')
makedepends=('python-build' 'python-installer' 'python-wheel'
        'python-setuptools-scm' 'git')
replaces=('eml_to_pdf-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/plenaerts/eml2pdf/archive/tags/v${pkgver}.tar.gz")
sha256sums=('b36cd88ee675543b313033706a2ba1e20f8e62e8f3dee1745d1ee677e6c49d72')

check() {
    cd "${pkgname}-tags-v${pkgver}"
    pytest
}

build() {
    SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
    cd "${pkgname}-tags-v${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-tags-v${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
