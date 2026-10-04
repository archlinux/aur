# Maintainer: PandaDEV <contact@pandadev.net>
pkgname=dbdelve-bin
pkgver=0.3.0
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
sha256sums_x86_64=('6bb334b46992cb51fa543bf057baca3230aa09f5d9111d7819e327a88b53dd0b')
sha256sums_aarch64=('d45de0f184aa585e096757682c3ea8b57842f7dbcdac4b17ee58663d988d1d03')

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
