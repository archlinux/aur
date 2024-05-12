# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=zathura-pdf-mupdf
pkgver=0.4.1
pkgrel=21
pkgdesc="PDF support for Zathura (MuPDF backend) (Supports PDF, ePub, and OpenXPS)"
url="https://pwmt.org/projects/zathura-pdf-mupdf/"
arch=('x86_64')
license=('Zlib')
conflicts=('zathura-pdf-poppler')
depends=('cairo' 'gumbo-parser' 'jbig2dec' 'libjpeg' 'libmupdf' 'openjpeg2' 'openssl' 'zathura')
makedepends=('meson' 'ninja' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://git.pwmt.org/pwmt/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        0001-Remove-mupdf-linking-detection.patch)
sha512sums=('bf3360cdf6195af3cace4c769536a49f1cf2167c70a65b560410db1a0098119d726e73baeea98ca7100653c17248056c484fc436558e52a8dc12e7b83ce789b1'
            '4a6dff37fd25714b85118bf0161bfe83d337ac0fe486560c520fe7f1b56be54edc80e26851c031aa899a8435eee5baf3870d3fe7a6f4207d894931c10efd4835')

prepare() {
        cd "${pkgname}-${pkgver}"
        patch -p1 < "${srcdir}/0001-Remove-mupdf-linking-detection.patch"
}

build() {
        cd "${pkgname}-${pkgver}"
        arch-meson build
        ninja -C build
}

package() {
        cd "${pkgname}-${pkgver}"
        DESTDIR="${pkgdir}" ninja -C build install
        install -Dm 664 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
