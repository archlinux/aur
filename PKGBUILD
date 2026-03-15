# Maintainer: Kevin Walters <87kevo@gmail.com>
pkgname=chatty-twitch
pkgver=1.4.0
pkgrel=1
pkgdesc="A modern Twitch chat client for desktop — inspired by Chatterino"
arch=('x86_64')
url="https://github.com/KevinEightSeven/Chatty"
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'fuse2')
options=('!strip')
source=("Chatty-${pkgver}.AppImage::https://github.com/KevinEightSeven/Chatty/releases/download/v${pkgver}/Chatty.AppImage"
        "chatty-twitch.png::https://raw.githubusercontent.com/KevinEightSeven/Chatty/v${pkgver}/assets/icon.png")
sha256sums=('8dac995b1e534e648cb3f11ff05f46ba43a46e4eb0f791a4ad91d0b906b178d5'
            'SKIP')
noextract=("Chatty-${pkgver}.AppImage")

package() {
    install -Dm755 "${srcdir}/Chatty-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/Chatty.AppImage"

    # Desktop entry
    install -d "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/chatty-twitch.desktop" << 'DESKTOP'
[Desktop Entry]
Name=Chatty
Comment=Modern Twitch Chat Client
Exec=/opt/chatty-twitch/Chatty.AppImage --no-sandbox
Icon=chatty-twitch
Type=Application
Categories=Chat;Network;
DESKTOP

    # Icon
    install -Dm644 "${srcdir}/chatty-twitch.png" "${pkgdir}/usr/share/pixmaps/chatty-twitch.png"

    # Launcher script
    install -d "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/chatty-twitch" << 'LAUNCHER'
#!/bin/bash
exec /opt/chatty-twitch/Chatty.AppImage --no-sandbox "$@"
LAUNCHER
    chmod 755 "${pkgdir}/usr/bin/chatty-twitch"
}
