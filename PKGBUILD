# Maintainer: Bjarne Øverli <bjarne@oever.li>
pkgname=aether
pkgver=4.0.3
pkgrel=1
pkgdesc='Desktop theming application - extract colors from wallpapers and apply cohesive themes'
arch=('x86_64' 'aarch64')
url='https://github.com/bjarneo/aether'
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3')
source=("aether-${pkgver}.tar.gz::https://github.com/bjarneo/aether/archive/refs/tags/v${pkgver}.tar.gz")
source_x86_64=("aether-linux-amd64-${pkgver}::https://github.com/bjarneo/aether/releases/download/v${pkgver}/aether-linux-amd64")
source_aarch64=("aether-linux-arm64-${pkgver}::https://github.com/bjarneo/aether/releases/download/v${pkgver}/aether-linux-arm64")
sha256sums=('f17d3382a6443008a2ba6c2c2d20623ce1787dc16140dc7a8037fe167af54f19')
sha256sums_x86_64=('2b98a3c2567339252a467717902748d53739248c293981da7b22bd7cc182a160')
sha256sums_aarch64=('0484fb2f1d86b7e650648dd0a4a0c709ec13fd85740de0c4bc9f14c426d4fb5d')
noextract=("aether-linux-amd64-${pkgver}" "aether-linux-arm64-${pkgver}")

package() {
    if [[ "$CARCH" == "x86_64" ]]; then
        install -Dm755 "${srcdir}/aether-linux-amd64-${pkgver}" "${pkgdir}/usr/bin/aether"
    elif [[ "$CARCH" == "aarch64" ]]; then
        install -Dm755 "${srcdir}/aether-linux-arm64-${pkgver}" "${pkgdir}/usr/bin/aether"
    fi

    cd "${srcdir}/aether-${pkgver}"
    install -Dm644 build/linux/aether.desktop "${pkgdir}/usr/share/applications/aether.desktop"
    install -Dm644 icon.png "${pkgdir}/usr/share/pixmaps/aether.png"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/aether/README.md"
}
