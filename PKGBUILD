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
    # Installiere den Client in /opt
    install -d "${pkgdir}/opt/teamspeak6"
    cp -r "${srcdir}/"* "${pkgdir}/opt/teamspeak6"
    chmod +x "${pkgdir}/opt/teamspeak6/TeamSpeak"
    chmod +x "${pkgdir}/opt/teamspeak6/hotkey_helper" || true

    # Symlink für einfache Ausführung
    install -d "${pkgdir}/usr/bin"
    ln -s /opt/teamspeak6/TeamSpeak "${pkgdir}/usr/bin/teamspeak6"

    # Desktop-Datei direkt erzeugen
    install -d "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/teamspeak6.desktop" <<EOF
[Desktop Entry]
Name=TeamSpeak 6
Comment=Next generation TeamSpeak client
Exec=teamspeak6
Icon=teamspeak6
Terminal=false
Type=Application
Categories=Network;Chat;VoiceChat;
EOF

    # Icons in verschiedenen Größen installieren
    install -Dm644 "${srcdir}/logo-48.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/teamspeak6.png"
    install -Dm644 "${srcdir}/logo-128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/teamspeak6.png"
    install -Dm644 "${srcdir}/logo-256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/teamspeak6.png"
}
