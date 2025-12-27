# Maintainer: Pieter Lenaerts <pieter.lenaerts@outlook.be>
pkgname=eml2pdf
pkgver=1.1
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
sha256sums=('05672e11175ba10a34bc29f4e3f53f6f6436674f5580590c97659d48783007e9')

build() {
    SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
