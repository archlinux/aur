# Maintainer: ramisotti13-eng
pkgname=basecamp-linux
pkgver=2.0
pkgrel=2
pkgdesc="Unofficial Linux companion app for Mountain peripherals (Everest Max/60 keyboards, Makalu 67/Max mouse, DisplayPad)"
arch=('x86_64')
url="https://github.com/ramisotti13-eng/BaseCamp-Linux"
license=('GPL3')
depends=('fuse2')
optdepends=('xdotool: keypress/text actions on X11'
            'ydotool: keypress/text actions on Wayland'
            'zenity: native file picker on GNOME and other non-KDE desktops'
            'kdialog: native file picker on KDE'
            'playerctl: required by the Now Playing plugin (MPRIS media control)')
source=("${pkgname}-${pkgver}.AppImage::https://github.com/ramisotti13-eng/BaseCamp-Linux/releases/download/v${pkgver}/BaseCamp-Linux-x86_64-fedora.AppImage"
        "99-mountain.rules::https://raw.githubusercontent.com/ramisotti13-eng/BaseCamp-Linux/v${pkgver}/99-mountain.rules"
        "app_icon_256.png::https://raw.githubusercontent.com/ramisotti13-eng/BaseCamp-Linux/v${pkgver}/resources/app_icon_256.png"
        "basecamp-linux.desktop")
sha256sums=('b90cbc8a8d40c3607e4cce3c107df360e3d41f40fb84620bd2bb1ea3905d9137'
            'SKIP'
            'SKIP'
            'SKIP')
options=(!strip)

package() {
    # Install AppImage
    install -Dm755 "${pkgname}-${pkgver}.AppImage" "${pkgdir}/usr/bin/basecamp-linux"

    # Install udev rule
    install -Dm644 "99-mountain.rules" \
        "${pkgdir}/usr/lib/udev/rules.d/99-mountain.rules"

    # Install icon
    install -Dm644 "app_icon_256.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/basecamp-linux.png"

    # Install desktop entry
    install -Dm644 "basecamp-linux.desktop" \
        "${pkgdir}/usr/share/applications/basecamp-linux.desktop"
}
