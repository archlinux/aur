# Maintainer: Bjarne Øverli <bjarne@oever.li>
pkgname=aether
pkgver=4.29.7
pkgrel=1
pkgdesc='Desktop theming application - extract colors from wallpapers and apply cohesive themes'
arch=('x86_64' 'aarch64')
url='https://github.com/omacom-io/aether'
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3')
source=("aether-${pkgver}.tar.gz::https://github.com/omacom-io/aether/archive/refs/tags/v${pkgver}.tar.gz")
source_x86_64=("aether-linux-amd64-${pkgver}::https://github.com/omacom-io/aether/releases/download/v${pkgver}/aether-linux-amd64")
source_aarch64=("aether-linux-arm64-${pkgver}::https://github.com/omacom-io/aether/releases/download/v${pkgver}/aether-linux-arm64")
sha256sums=('3e02902dae13b5600e6ac7c1c8120d0cd1910538baa29a4efba6b0cec83b507a')
sha256sums_x86_64=('9239abb6b16e384a544905a6f19247acc16e26a75c684d33844571b20930e56e')
sha256sums_aarch64=('5e3018b9fdaf9dc5d3aee0ea512d7ad361b14d4704800877dcd8a18f78f2c763')
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
