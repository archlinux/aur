# Maintainer: Dheeraj Vittal Shenoy <dheerajshenoy22@gmail.com>
pkgname=lektra-bin
pkgver=0.7.5
pkgrel=0
pkgdesc="High-performance Document and Image viewer that prioritizes screen space and control"
arch=('x86_64')
url="https://codeberg.org/lektra/lektra"
license=('AGPL-3.0')
depends=(
    'qt6-base'
    'qt6-imageformats'
    'djvulibre'
    'lua'
)
provides=('lektra')
conflicts=('lektra' 'lektra-git')
source=(
    "lektra-${pkgver}-x86_64.tar.gz::https://codeberg.org/lektra/lektra/releases/download/v${pkgver}/lektra-${pkgver}-x86_64.tar.gz"
)
sha256sums=('9501af894ff41062febd83cfe100eeeb5a9eee475bea7d4cfbe8300711d1af08')

package() {
    install -Dm755 "${srcdir}/usr/bin/lektra"                              "${pkgdir}/usr/bin/lektra"
    install -Dm644 "${srcdir}/usr/share/applications/lektra.desktop"       "${pkgdir}/usr/share/applications/lektra.desktop"
    install -Dm644 "${srcdir}/usr/share/man/man1/lektra.1"                 "${pkgdir}/usr/share/man/man1/lektra.1"
    install -Dm644 "${srcdir}/usr/share/doc/lektra/tutorial.pdf"           "${pkgdir}/usr/share/doc/lektra/tutorial.pdf"

    install -dm755 "${pkgdir}/usr/share/lektra"
    cp -r "${srcdir}/usr/share/lektra/lua" "${pkgdir}/usr/share/lektra/"

    # Icons (recursive, preserving structure)
    cp -r "${srcdir}/usr/share/icons/hicolor" "${pkgdir}/usr/share/icons/"
}
