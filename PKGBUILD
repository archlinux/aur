# Maintainer: PandaDEV <contact@pandadev.net>
pkgname=dbdelve-bin
pkgver=0.2.1
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
sha256sums_x86_64=('0ff86a0a43f6d362c8cd99644f9f44dfa9b6137d7f125e8e7dc75991c8fceafb')
sha256sums_aarch64=('858b857ec3c52b7eeaaf19cc17067fa514387cbd49b60c2bfda1683d514e603d')

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
