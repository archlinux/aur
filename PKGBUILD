# Maintainer: LBK Team <info@lbklauncher.com>

pkgname=lbk-launcher-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="Інсталятор українізаторів відеоігор"
arch=('x86_64')
url="https://lbklauncher.com"
license=('GPL-3.0-or-later')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libnotify')
optdepends=('libappindicator-gtk3: system tray support')
provides=('lbk-launcher')
conflicts=('lbk-launcher')
options=(!strip !debug)
source=(
    "LBK-Launcher-linux.AppImage::https://github.com/Vadko/lbk-launcher/releases/download/v${pkgver}/LBK-Launcher-linux.AppImage"
    "lbk-launcher.sh"
    "lbk-launcher.desktop"
    "icon-32.png::https://raw.githubusercontent.com/Vadko/lbk-launcher/master/aur/icons/icon-32.png"
    "icon-48.png::https://raw.githubusercontent.com/Vadko/lbk-launcher/master/aur/icons/icon-48.png"
    "icon-64.png::https://raw.githubusercontent.com/Vadko/lbk-launcher/master/aur/icons/icon-64.png"
    "icon-128.png::https://raw.githubusercontent.com/Vadko/lbk-launcher/master/aur/icons/icon-128.png"
    "icon-256.png::https://raw.githubusercontent.com/Vadko/lbk-launcher/master/aur/icons/icon-256.png"
)
sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
)

prepare() {
    chmod +x "${srcdir}/LBK-Launcher-linux.AppImage"
    "${srcdir}/LBK-Launcher-linux.AppImage" --appimage-extract
}

package() {
    # Install app files
    install -dm755 "${pkgdir}/opt/lbk-launcher"
    cp -r "${srcdir}/squashfs-root/"* "${pkgdir}/opt/lbk-launcher/"

    # Fix permissions
    chmod 755 "${pkgdir}/opt/lbk-launcher/lbk-launcher"
    find "${pkgdir}/opt/lbk-launcher/" -type d -exec chmod 755 {} +

    # Install wrapper script
    install -Dm755 "${srcdir}/lbk-launcher.sh" "${pkgdir}/usr/bin/lbk-launcher"

    # Install desktop entry
    install -Dm644 "${srcdir}/lbk-launcher.desktop" "${pkgdir}/usr/share/applications/lbk-launcher.desktop"

    # Install icons
    install -Dm644 "${srcdir}/icon-256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/lbk-launcher.png"
    install -Dm644 "${srcdir}/icon-128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/lbk-launcher.png"
    install -Dm644 "${srcdir}/icon-64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/lbk-launcher.png"
    install -Dm644 "${srcdir}/icon-48.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/lbk-launcher.png"
    install -Dm644 "${srcdir}/icon-32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/lbk-launcher.png"
}
