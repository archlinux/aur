# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=zaman
pkgver=1.3.2
pkgrel=1
pkgdesc="A simple CLI tool to display (or save) man pages as PDFs"
url="https://github.com/Antiz96/zaman"
arch=('any')
license=('GPL-3.0-or-later')
depends=('man-db' 'xdg-utils')
makedepends=('scdoc')
checkdepends=('bats')
optdepends=('zathura: Fallback PDF reader'
            'zathura-pdf-poppler: PDF support for zathura using the poppler engine'
            'zathura-pdf-mupdf: PDF support for zathura using the MuPDF backend'
            'rofi: Dynamic menu support with rofi'
            'dmenu: Dynamic menu support with dmenu')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('f93cc900bf3b57d7d9e0f03f86b34eacd766b2f591162c9e4b760738acda7563')

prepare() {
        cd "${pkgname}-${pkgver}"
        make clean
}

build() {
        cd "${pkgname}-${pkgver}"
        make
}

check() {
        cd "${pkgname}-${pkgver}"
        make test
}

package() {
        cd "${pkgname}-${pkgver}"
        make PREFIX=/usr DESTDIR="${pkgdir}" install
}
