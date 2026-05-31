# Maintainer: Bjarne Øverli <bjarne@oever.li>
pkgname=aether
pkgver=4.26.0
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
sha256sums=('85f37c524a66b5037b5b1484d6ebe3a60697b4ea3ed1cae0763bc99ca4e4b774')
sha256sums_x86_64=('5f75367f972cdcf43ae05a693c30ec5fd4ade691480fc298e9de131dc247c02f' '0264ee493c3982913b52854049ae305b843c4970296fe2fc3fa65fd681b13c1e')
sha256sums_aarch64=('da133dd41fecae12a50798975d58e1607ceea8b08a1ad2ae7a7583c0422bbf68' '9e42f326db4f55e85b4fdf2f4ca8f03a2904529a430eeca6caefe59182432344')
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
