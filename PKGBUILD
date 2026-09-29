# Maintainer: Bjarne Øverli <bjarne@oever.li>
pkgname=aether
pkgver=4.31.0
pkgrel=1
pkgdesc='Desktop theming application - extract colors from wallpapers and apply cohesive themes'
arch=('x86_64' 'aarch64')
url='https://github.com/omacom/aether'
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3')
optdepends=('omarchy: native theme activation and shell selectors')
source=("aether-${pkgver}.tar.gz::https://github.com/omacom/aether/archive/refs/tags/v${pkgver}.tar.gz")
source_x86_64=("aether-linux-amd64-${pkgver}::https://github.com/omacom/aether/releases/download/v${pkgver}/aether-linux-amd64")
source_aarch64=("aether-linux-arm64-${pkgver}::https://github.com/omacom/aether/releases/download/v${pkgver}/aether-linux-arm64")
sha256sums=('7ccbf7eafce7dc70fd8ea7f11e81d17efb3c818a2a943bd931ee9443df56422f')
sha256sums_x86_64=('470b71ffca9d4ea0004042f7294673bdc245eed4396dcf76fb9724064a62978c')
sha256sums_aarch64=('5dd88c4698aaabe8310cfd8f627055c8982d0edea434df3a2a0f351b1abb7663')
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
    install -Dm755 contrib/quickshell/install.sh "${pkgdir}/usr/bin/aether-install-omarchy-plugins"
    install -Dm644 contrib/quickshell/wallpapers/manifest.json "${pkgdir}/usr/share/aether/omarchy-plugins/wallpapers/manifest.json"
    install -Dm644 contrib/quickshell/wallpapers/shell.qml "${pkgdir}/usr/share/aether/omarchy-plugins/wallpapers/shell.qml"
    install -Dm644 contrib/quickshell/wallpapers/WallpaperSlider.qml "${pkgdir}/usr/share/aether/omarchy-plugins/wallpapers/WallpaperSlider.qml"
    install -Dm644 contrib/quickshell/blueprints/manifest.json "${pkgdir}/usr/share/aether/omarchy-plugins/blueprints/manifest.json"
    install -Dm644 contrib/quickshell/blueprints/shell.qml "${pkgdir}/usr/share/aether/omarchy-plugins/blueprints/shell.qml"
    install -Dm644 contrib/quickshell/blueprints/Blueprints.qml "${pkgdir}/usr/share/aether/omarchy-plugins/blueprints/Blueprints.qml"
}
