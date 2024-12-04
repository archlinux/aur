# Maintainer: Pieter Lenaerts <pieter.aj.lenaerts@gmail.com>
pkgname=eml_to_pdf-git
pkgver=r7.13260f7
pkgrel=1
pkgdesc="Convert .eml (email) files to PDF using Python."
arch=(any)
url="https://github.com/klokie/eml-to-pdf"
license=('MIT')
depends=('python-pdfkit')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('eml_to_pdf::git+https://github.com/klokie/eml-to-pdf')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
    cd "${pkgname%-git}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname%-git}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
