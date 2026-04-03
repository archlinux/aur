# Maintainer: Bjarne Øverli <bjarne@oever.li>
pkgname=aether
pkgver=4.6.5
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
sha256sums=('25b8d8ef6e4307e9ccbc8661fd587b578af351e856ee3f48aacc8dbfe82be6e2')
sha256sums_x86_64=('07e8213358a208167e849b43362164dab84ca4e30923377ed8ee67ac2e361d99' '41018e86368a975564700fbe1c56a65ffc1709d79ce5e80ba1a27411c2771c9d')
sha256sums_aarch64=('f34e132a0cd97d4d8b38c0171a573866826115a515862e59d62651e5528434fe' 'fecbb1a6cead952146f8f1b0f32c25176c021fde0f946614efbcf426573e8268')
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
