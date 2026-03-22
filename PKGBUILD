# Maintainer: Bjarne Øverli <bjarne@oever.li>
pkgname=aether
pkgver=4.3.0
pkgrel=1
pkgdesc='Desktop theming application - extract colors from wallpapers and apply cohesive themes'
arch=('x86_64' 'aarch64')
url='https://github.com/bjarneo/aether'
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'gtk-layer-shell' 'gstreamer' 'gst-plugins-good' 'ffmpeg')
source=("aether-${pkgver}.tar.gz::https://github.com/bjarneo/aether/archive/refs/tags/v${pkgver}.tar.gz")
source_x86_64=("aether-linux-amd64-${pkgver}::https://github.com/bjarneo/aether/releases/download/v${pkgver}/aether-linux-amd64"
     "aether-wp-linux-amd64-${pkgver}::https://github.com/bjarneo/aether/releases/download/v${pkgver}/aether-wp-linux-amd64")
source_aarch64=("aether-linux-arm64-${pkgver}::https://github.com/bjarneo/aether/releases/download/v${pkgver}/aether-linux-arm64"
      "aether-wp-linux-arm64-${pkgver}::https://github.com/bjarneo/aether/releases/download/v${pkgver}/aether-wp-linux-arm64")
sha256sums=('ba1b535fdd5886e922009e76f9d8cc9aea1d70a70b851d66368dace59d37fd7b')
sha256sums_x86_64=('09035bf4cba30e9cdd94ff7e84d816dcd60c279acd7039083e308858970a5df9' '339850123abebb4ff6be890de928b18ec68ee11477712542425cf97d9fef6db2')
sha256sums_aarch64=('2fb51e70f221a0a9d33fc304c567b7c22d9ab075d3aef3e819eb4eefc4abe7ec' '63945175a5bcb6a29892f703ad60ed2998261b7f0a87c99043b16ff1dae6aa47')
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
