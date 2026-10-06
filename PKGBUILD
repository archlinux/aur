# Maintainer: PandaDEV <contact@pandadev.net>
pkgname=dbdelve-bin
pkgver=0.3.3
pkgrel=1
pkgdesc='A modern and performant database client for PostgreSQL, MySQL and SQLite'
arch=('x86_64' 'aarch64')
url='https://github.com/ShayanAbbas1/dbdelve'
license=('MIT' 'OFL-1.1')
depends=('glibc' 'gcc-libs' 'hicolor-icon-theme' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11'
         'libglvnd' 'vulkan-icd-loader' 'wayland')
optdepends=('org.freedesktop.secrets: store database passwords in a Secret Service keyring'
            'xdg-desktop-portal: file export dialogs')
provides=("dbdelve=${pkgver}")
conflicts=('dbdelve')
options=('!strip' '!debug')
source_x86_64=("${url}/releases/download/v${pkgver}/dbdelve-${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/dbdelve-${pkgver}-linux-aarch64.tar.gz")
sha256sums_x86_64=('9768e2918622d9fe1e3481ec67ad339857200a66d427884b1c31f726935b533c')
sha256sums_aarch64=('11cfe789c5cff590a473ea60db89b12f190aabd04d4053c5f9a514555c99caa9')

package() {
    cd "${srcdir}/dbdelve-${pkgver}-linux-${CARCH}"

    install -Dm755 dbdelve "${pkgdir}/usr/bin/dbdelve"
    install -Dm644 dbdelve.desktop "${pkgdir}/usr/share/applications/dbdelve.desktop"

    local size
    for size in 16 32 64 128 256 512; do
        install -Dm644 "icons/dbdelve-${size}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/dbdelve.png"
    done

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 NOTICES.md "${pkgdir}/usr/share/licenses/${pkgname}/NOTICES.md"
    install -Dm644 licenses/OFL-1.1.txt \
        "${pkgdir}/usr/share/licenses/${pkgname}/licenses/OFL-1.1.txt"
}
