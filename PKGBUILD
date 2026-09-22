# Maintainer: MematiBas42
pkgname=cloudstream-desktop-bin
pkgver=1.0.0
pkgrel=2
pkgdesc="CloudStream desktop client for Linux (Early test build - contributions welcome)"
arch=('x86_64')
url="https://github.com/MematiBas42/cloudstream-desktop"
license=('GPL3')
depends=('alsa-lib' 'gtk3' 'libmpv.so')
provides=('cloudstream-desktop')
conflicts=('cloudstream-desktop')
source=("cloudstream-desktop-${pkgver}.tar.gz::https://github.com/MematiBas42/cloudstream-desktop/releases/download/v${pkgver}/CloudStream-${pkgver}-Linux-x64-Portable.tar.gz"
        "cloudstream-desktop.desktop")
sha256sums=('780c35af82017914589afa89cfb36da69078b4e28835aafd3e26f56dbd33fcb7'
            '5c10944d6a3743167a1b2b8af72c2eff2fe89db58782ed63fd656b147b19bd9f')

package() {
    install -dm755 "${pkgdir}/opt/cloudstream-desktop"
    cp -r "${srcdir}/cloudstream-desktop/"* "${pkgdir}/opt/cloudstream-desktop/"

    # Create binary symlink
    install -dm755 "${pkgdir}/usr/bin"
    ln -sf /opt/cloudstream-desktop/bin/cloudstream-desktop "${pkgdir}/usr/bin/cloudstream-desktop"

    # Install Desktop Entry
    install -Dm644 "${srcdir}/cloudstream-desktop.desktop" "${pkgdir}/usr/share/applications/cloudstream-desktop.desktop"

    # Install Application Icon
    if [ -f "${pkgdir}/opt/cloudstream-desktop/lib/cloudstream-desktop.png" ]; then
        install -Dm644 "${pkgdir}/opt/cloudstream-desktop/lib/cloudstream-desktop.png" \
            "${pkgdir}/usr/share/icons/hicolor/256x256/apps/cloudstream-desktop.png"
    fi
}
