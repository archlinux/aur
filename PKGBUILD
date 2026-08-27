# Maintainer: Bjarne Øverli <bjarne@oever.li>
pkgname=aether
pkgver=4.29.6
pkgrel=1
pkgdesc='Desktop theming application - extract colors from wallpapers and apply cohesive themes'
arch=('x86_64' 'aarch64')
url='https://github.com/omacom-io/aether'
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3')
source=("aether-${pkgver}.tar.gz::https://github.com/omacom-io/aether/archive/refs/tags/v${pkgver}.tar.gz")
source_x86_64=("aether-linux-amd64-${pkgver}::https://github.com/omacom-io/aether/releases/download/v${pkgver}/aether-linux-amd64")
source_aarch64=("aether-linux-arm64-${pkgver}::https://github.com/omacom-io/aether/releases/download/v${pkgver}/aether-linux-arm64")
sha256sums=('8b2e97283007c9eefda879e17c5fecb9d59fc90bf2160af93eeba57f11fcdb25')
sha256sums_x86_64=('47b5afa4144b3a3cd7755524956ffe6b074ed5f2f90dadda23e424efeaf88790')
sha256sums_aarch64=('52d1ffb201970ddb6205882a8e1c583cae63470d4180f4bc2fc6298dfb71ddd9')
noextract=("aether-linux-amd64-${pkgver}" "aether-linux-arm64-${pkgver}")

package() {
    if [[ "$CARCH" == "x86_64" ]]; then
        install -Dm755 "${srcdir}/aether-linux-amd64-${pkgver}" "${pkgdir}/usr/bin/aether"
    elif [[ "$CARCH" == "aarch64" ]]; then
        install -Dm755 "${srcdir}/aether-linux-arm64-${pkgver}" "${pkgdir}/usr/bin/aether"
    fi

    cd "${srcdir}/aether-${pkgver}"
    install -Dm644 build/linux/aether.desktop "${pkgdir}/usr/share/applications/aether.desktop"
    install -Dm644 li.oever.aether.url-handler.desktop "${pkgdir}/usr/share/applications/li.oever.aether.url-handler.desktop"
    install -Dm644 icon.png "${pkgdir}/usr/share/pixmaps/aether.png"
    install -Dm644 assets/aether-icon-512.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/aether.png"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/aether/README.md"
}
