# Maintainer: ramisotti13-eng
pkgname=basecamp-linux
pkgver=1.6.0
pkgrel=1
pkgdesc="Unofficial Linux companion app for Mountain peripherals (Everest Max keyboard, Makalu 67 mouse, DisplayPad)"
arch=('x86_64')
url="https://github.com/ramisotti13-eng/BaseCamp-Linux"
license=('GPL3')
depends=('fuse2')
source=("${pkgname}-${pkgver}.AppImage::https://github.com/ramisotti13-eng/BaseCamp-Linux/releases/download/v${pkgver}/BaseCamp-Linux-x86_64-fedora.AppImage"
        "99-mountain.rules::https://github.com/ramisotti13-eng/BaseCamp-Linux/releases/download/v${pkgver}/99-mountain.rules"
        "app_icon_256.png::https://raw.githubusercontent.com/ramisotti13-eng/BaseCamp-Linux/main/resources/app_icon_256.png"
        "basecamp-linux.desktop")
sha256sums=('f10a9f19a0f2ea1fc7c9ca845abb04497f314ee3918cafc60b7d7225c95bd395'
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
