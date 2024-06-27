# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=zathura-pdf-mupdf
pkgver=0.4.3
pkgrel=4
pkgdesc="PDF support for Zathura (MuPDF backend) (Supports PDF, ePub, and OpenXPS)"
url="https://pwmt.org/projects/zathura-pdf-mupdf/"
arch=('x86_64')
license=('Zlib')
conflicts=('zathura-pdf-poppler')
depends=('cairo' 'gumbo-parser' 'jbig2dec' 'libjpeg' 'libmupdf' 'openjpeg2' 'openssl' 'zathura')
makedepends=('meson' 'ninja' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pwmt/${pkgname}/archive/refs/tags/${pkgver}.tar.gz"
        0001-Remove-mupdf-linking-detection.patch)
sha512sums=('ffab536d1cea26dd08fbb3808e0ff5d4b5b126bfdbd19a79101ac519ee9951d916b75c5b1b1e459f453087c936d84fa3839b4b84dd7f92398ba5cca87e186795'
            '53f76de2e857a8f57ed9da00e7d0d4c647c38c1a3cb318b27427a1201d7290654aaa3271088e6839f989c7b0ac2a29d353b8bc01561c82e38f33bdb8aba6208c')

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
