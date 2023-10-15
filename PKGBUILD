# Maintainer: Felipe Alfonso Gonzalez <f.alfonso@res-ear.ch>
pkgname=term-pdf
pkgver=0.0.3.4
pkgrel=1
pkgdesc="TermPDF Viewer is an open-source PDF file viewer designed to run in the terminal."
arch=('x86_64')
url="https://github.com/felipealfonsog/TermPDFViewer"
license=('MIT')
depends=('python-pip' 'python-pymupdf')

source=(
    "https://github.com/felipealfonsog/TermPDFViewer/archive/refs/tags/v.${pkgver}.tar.gz"
    "https://github.com/felipealfonsog/TermPDFViewer/raw/main/term-pdf-wrp.c"
)

sha256sums=('edadcca6626f9bd839816c72df90d331ecd8f1af0604628ea2d167eeb9548461')

prepare() {
    tar xf "v.${pkgver}.tar.gz" -C "$srcdir" --strip-components=1
    mv "$srcdir"/term-pdf-wrp.c "$srcdir"/TermPDFViewer-v."$pkgver"/src
}

build() {
    cd "$srcdir"/TermPDFViewer-v."${pkgver}"
    gcc -o term-pdf-wrp src/term-pdf-wrp.c
}

package() {
    install -Dm755 "$srcdir"/TermPDFViewer-v."${pkgver}"/term-pdf-wrp "${pkgdir}/usr/bin/term-pdf"
}
