# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=zathura-pdf-mupdf
pkgver=0.4.2
pkgrel=1
pkgdesc="PDF support for Zathura (MuPDF backend) (Supports PDF, ePub, and OpenXPS)"
url="https://pwmt.org/projects/zathura-pdf-mupdf/"
arch=('x86_64')
license=('Zlib')
conflicts=('zathura-pdf-poppler')
depends=('cairo' 'gumbo-parser' 'jbig2dec' 'libjpeg' 'libmupdf' 'openjpeg2' 'openssl' 'zathura')
makedepends=('meson' 'ninja' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pwmt/${pkgname}/archive/refs/tags/${pkgver}.tar.gz"
        0001-Remove-mupdf-linking-detection.patch)
sha512sums=('903f1543781c02e0175e6ba29d9abeb9a6b085c1fa9f115c57e64f18c40c4e6e66b8a54fef4021f9ed5914222d6f689b3f0032f997aa70250a6aa26b9d6da5cf'
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
