# Maintainer: Bjarne Øverli <bjarne@oever.li>
pkgname=aether
pkgver=4.29.2
pkgrel=1
pkgdesc='Desktop theming application - extract colors from wallpapers and apply cohesive themes'
arch=('x86_64' 'aarch64')
url='https://github.com/bjarneo/aether'
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3')
source=("aether-${pkgver}.tar.gz::https://github.com/bjarneo/aether/archive/refs/tags/v${pkgver}.tar.gz")
source_x86_64=("aether-linux-amd64-${pkgver}::https://github.com/bjarneo/aether/releases/download/v${pkgver}/aether-linux-amd64")
source_aarch64=("aether-linux-arm64-${pkgver}::https://github.com/bjarneo/aether/releases/download/v${pkgver}/aether-linux-arm64")
sha256sums=('1756a54f1f823ea78d3e0011ba51696e751e9372bf24ddcf0269d57ef2322043')
sha256sums_x86_64=('1722a8abaa9379cf592bc5886984398d5b2dac8e6a0007071ef809f4e4118bd5')
sha256sums_aarch64=('d9dc740c92ff29ee9f1e954af1d33e0dcbf513745dcd88f36db8faea995aa897')
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
