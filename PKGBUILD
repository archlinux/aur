# Maintainer: Bjarne Øverli <bjarne@oever.li>
pkgname=aether
pkgver=4.28.5
pkgrel=1
pkgdesc='Desktop theming application - extract colors from wallpapers and apply cohesive themes'
arch=('x86_64' 'aarch64')
url='https://github.com/bjarneo/aether'
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3')
source=("aether-${pkgver}.tar.gz::https://github.com/bjarneo/aether/archive/refs/tags/v${pkgver}.tar.gz")
source_x86_64=("aether-linux-amd64-${pkgver}::https://github.com/bjarneo/aether/releases/download/v${pkgver}/aether-linux-amd64")
source_aarch64=("aether-linux-arm64-${pkgver}::https://github.com/bjarneo/aether/releases/download/v${pkgver}/aether-linux-arm64")
sha256sums=('6da69ec02336d3b8cf2e01fa89a3472156a4fc583e7d7462c299c299f37c99df')
sha256sums_x86_64=('d7e5a8ada829226373c57baf73eec57459fad8dd564750dd9e1722a8ef244eef')
sha256sums_aarch64=('33f0d0b8c921ceea102cb421f8027ea85ec08ced21ca71aa9a8a3d577a4cfbd4')
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
