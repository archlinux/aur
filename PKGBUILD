# Maintainer: Bjarne Øverli <bjarne@oever.li>
pkgname=aether
pkgver=4.6.2
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
sha256sums=('07253ecb5f75cff7cacc7a673799e13584972eca1569c792c4766d6a26f48563')
sha256sums_x86_64=('de6079ed789013b120cbe76fa150e1277133fa7a05dcc6e22e5a504bf08e1846' 'e0df09004ba4f7239c94b45426ddabb25d564414606560cf44bf283f67429c15')
sha256sums_aarch64=('c97420880af2a9be6a580628450f1721ff151acd13095190eb0bd7d9a6404d5d' 'f7b5bd00613cff22a8471e8810f5e19460d4ed2df2459f62e5cb5467efb11e91')
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
