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
sha256sums=('6d073a09ba8e34c9ad4946a09576352b5cc3c9adb9ef75703b149bc9d8996342'
            'af09814ba8dadd51412ad4b79fe9f5382a3289e8fc82ddbc4d031b7c849c3131'
            'ae904b33f9fa483170f816f4ead2d35ef7a163200b1079e0a86c116f78634e0c'
            'a459c319b429a0bb50a7a1d8a519a477757733f6b0ad9cea63780837c2a01e1a'
            'b66ba4c572d0756cf028968dedf1eada20af644eda7e9855ce1b43170e06cad0'
            'af399f2039afe0f5e786ac8d03a781180c983d7e0ef64c4441634bc6e39e639d'
            '189026e6f718e05561819cfbe53beb215ca2db7cc28ebe364d32a4131be150e9'
            '1556ac85d8f75e379905c933e2a48c7fef58fe9869195080b2ef701e1bcabe53')

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
