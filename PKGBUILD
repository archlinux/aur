# Maintainer: ebbo
pkgname=teamspeak6
pkgver=6.0.0_beta2
pkgrel=1
pkgdesc="TeamSpeak 6 client (beta)"
arch=('x86_64')
url="https://www.teamspeak.com/"
license=('custom')
depends=('glibc' 'fuse2' 'libxcb' 'libx11' 'libxcomposite' 'libxdamage' 'libxrandr' 'libxext' 'libxfixes' 'libxkbcommon' 'gtk3' 'nss' 'at-spi2-core')
source=("teamspeak-client-${pkgver}.tar.gz::https://files.teamspeak-services.com/pre_releases/client/6.0.0-beta2/teamspeak-client.tar.gz")
sha256sums=('de334fbf7b90d91ced475a785d034b520e4856bbd6fdd71db6a5dd88624a552b')

package() {
    install -d "${pkgdir}/opt/teamspeak6"
    cp -r "${srcdir}/teamspeak-client"/* "${pkgdir}/opt/teamspeak6"

    # Make main binary executable
    chmod +x "${pkgdir}/opt/teamspeak6/TeamSpeak"

    # Create symlink for easier launch
    install -d "${pkgdir}/usr/bin"
    ln -s /opt/teamspeak6/TeamSpeak "${pkgdir}/usr/bin/teamspeak6"

    # Desktop integration
    install -Dm644 "${srcdir}/teamspeak-client/teamspeak-client.desktop" "${pkgdir}/usr/share/applications/teamspeak6.desktop"
    install -Dm644 "${srcdir}/teamspeak-client/logo-256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/teamspeak6.png"
}
