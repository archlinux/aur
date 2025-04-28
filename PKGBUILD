# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: tocer.deng <tocer.deng@gmail.com>

pkgname=apvlv
pkgver=0.7.0_final
pkgrel=1
pkgdesc="A PDF/EPUB/TXT/FB2/MOBI/CBZ/HTML viewer which behaves like Vim"
arch=('x86_64')
url="https://github.com/naihe2010/apvlv"
license=('GPL-2.0-or-later')
depends=('cmark' 'djvulibre' 'gcc-libs' 'glibc' 'libmupdf' 'qt6-base' 'qt6-webengine' 'quazip-qt6' 'tesseract')
makedepends=('clang' 'cmake' 'ghostscript' 'libreoffice-sdk' 'man-db' 'mujs' 'qt6-tools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver//_/-}.tar.gz")
sha256sums=('83359ec4d23d359acdab78f280d14e349d52f0deb5164ff60a2bed4180c22097')

build() {
    mkdir -p "${pkgname}-${pkgver//_/-}/share/doc/apvlv/translations"
    cmake -B build -S "${pkgname}-${pkgver//_/-}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_PREFIX_PATH=/usr/lib/qt6 \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build

    install -d "${pkgdir}/usr/share/man/man1"
    mv "${pkgdir}/usr/share/man/apvlv.1" "${pkgdir}/usr/share/man/man1"
}
