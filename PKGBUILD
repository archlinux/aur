# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Robin Candau <antiz@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=zathura-epub-mupdf
pkgver=2026.07.18
pkgrel=1
pkgdesc="EPUB support for Zathura (MuPDF backend) (Supports ePub, and OpenXPS)"
url="https://pwmt.org/projects/zathura-pdf-mupdf/"
arch=('x86_64')
license=('Zlib')
depends=('cairo' 'girara' 'glib2' 'libmupdf' 'zathura')
makedepends=('meson' 'ninja')
conflicts=('zathura-pdf-mupdf')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pwmt/zathura-pdf-mupdf/archive/${pkgver}.tar.gz")
sha512sums=('cec5771582475d2379507e91ea571b203a8fbd4861d86754108746603e4ec58a441442e0b5e6c9c707c8c8f45a05571b0535acc0bc2023631c8955e1112dda0d')

build() {
        cd "${pkgname/epub/pdf}-${pkgver}"
        arch-meson -Dpdf=disabled build
        ninja -C build
}

package() {
        cd "${pkgname/epub/pdf}-${pkgver}"
        DESTDIR="${pkgdir}" ninja -C build install
        install -Dm 664 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
