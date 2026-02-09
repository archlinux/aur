# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Robin Candau <antiz@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=zathura-epub-mupdf
pkgver=2026.02.03
pkgrel=1
pkgdesc="EPUB support for Zathura (MuPDF backend) (Supports ePub, and OpenXPS)"
url="https://pwmt.org/projects/zathura-pdf-mupdf/"
arch=('x86_64')
license=('Zlib')
depends=('cairo' 'girara' 'glib2' 'libmupdf' 'zathura')
makedepends=('meson' 'ninja')
conflicts=('zathura-pdf-mupdf')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pwmt/zathura-pdf-mupdf/archive/${pkgver}.tar.gz")
sha512sums=('25cddec7445669c24cc7f75374857947744f041227416d7027ddd7affc5b186ef048f3570f80c0bb0af66dc90669e035b75609bb8619d10ec34348e0c93878b8')

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
