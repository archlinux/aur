# Maintainer: Bjarne Øverli <bjarne@oever.li>
pkgname=aether
pkgver=4.6.3
pkgrel=1
pkgdesc='Desktop theming application - extract colors from wallpapers and apply cohesive themes'
arch=('x86_64' 'aarch64')
url='https://github.com/bjarneo/aether'
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'gtk-layer-shell' 'gstreamer' 'gst-plugins-good' 'gst-libav' 'ffmpeg')
source=("aether-${pkgver}.tar.gz::https://github.com/bjarneo/aether/archive/refs/tags/v${pkgver}.tar.gz")
source_x86_64=("aether-linux-amd64-${pkgver}::https://github.com/bjarneo/aether/releases/download/v${pkgver}/aether-linux-amd64"
     "aether-wp-linux-amd64-${pkgver}::https://github.com/bjarneo/aether/releases/download/v${pkgver}/aether-wp-linux-amd64")
source_aarch64=("aether-linux-arm64-${pkgver}::https://github.com/bjarneo/aether/releases/download/v${pkgver}/aether-linux-arm64"
      "aether-wp-linux-arm64-${pkgver}::https://github.com/bjarneo/aether/releases/download/v${pkgver}/aether-wp-linux-arm64")
sha256sums=('936090af0f7a010d2d50f0b9fa4e6b2eed952e1b2c53bf4d31b1ce6c127a4484')
sha256sums_x86_64=('7b885a36e87c0314a5558e68ad811ebf9905a70fbb9a0168f43d79057b8f8f57' '6b2b63e9db4e4a6f5936a5845601e4cc80667183ae00afd35857a535b856df9e')
sha256sums_aarch64=('37e084aa07647e48367ff1a13a16bf270136743ea6f2d5101404f939c584bdc1' 'd723e3eb267161e035d63df7930c58685db3a5e924ba4398b23380fddc4441f6')
noextract=("aether-linux-amd64-${pkgver}" "aether-linux-arm64-${pkgver}"
 "aether-wp-linux-amd64-${pkgver}" "aether-wp-linux-arm64-${pkgver}")

package() {
    if [[ "$CARCH" == "x86_64" ]]; then
        install -Dm755 "${srcdir}/aether-linux-amd64-${pkgver}" "${pkgdir}/usr/bin/aether"
        install -Dm755 "${srcdir}/aether-wp-linux-amd64-${pkgver}" "${pkgdir}/usr/bin/aether-wp"
    elif [[ "$CARCH" == "aarch64" ]]; then
        install -Dm755 "${srcdir}/aether-linux-arm64-${pkgver}" "${pkgdir}/usr/bin/aether"
        install -Dm755 "${srcdir}/aether-wp-linux-arm64-${pkgver}" "${pkgdir}/usr/bin/aether-wp"
    fi

    cd "${srcdir}/aether-${pkgver}"
    install -Dm644 build/linux/aether.desktop "${pkgdir}/usr/share/applications/aether.desktop"
    install -Dm644 icon.png "${pkgdir}/usr/share/pixmaps/aether.png"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/aether/README.md"
}
