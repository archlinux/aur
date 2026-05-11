# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Robin Candau <antiz@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=zathura-epub-mupdf
pkgver=2026.05.10
pkgrel=1
pkgdesc="EPUB support for Zathura (MuPDF backend) (Supports ePub, and OpenXPS)"
url="https://pwmt.org/projects/zathura-pdf-mupdf/"
arch=('x86_64')
license=('Zlib')
depends=('cairo' 'girara' 'glib2' 'libmupdf' 'zathura')
makedepends=('meson' 'ninja')
conflicts=('zathura-pdf-mupdf')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pwmt/zathura-pdf-mupdf/archive/${pkgver}.tar.gz")
sha512sums=('be8f6839cdcaae6e4d675a122c670e7d7592c43cd36c053944cb81d374afe092f19f625210a743843c3f934701511d7bdd7819dd38348e2b65834e9f48a9f7db')

build() {
        cd "${pkgname/epub/pdf}-${pkgver}"
        arch-meson -Dpdf=disabled -Dtests=disabled build
        ninja -C build
}

package() {
        cd "${pkgname/epub/pdf}-${pkgver}"
        DESTDIR="${pkgdir}" ninja -C build install
        install -Dm 664 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
