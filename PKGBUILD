# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=zaman
pkgver=1.3.0
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
sha256sums=('88e52bcd0350bf7f233be535d47536f66d5d15277f34f91a6c542affc410f877')

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
