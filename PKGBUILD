# Maintainer: Keiran <keircn@proton.me>

pkgname=pince-bin
pkgver=0.9.1
pkgrel=0
pkgdesc="Reverse engineering tool for linux games - front-end/reverse engineering tool for GDB"
arch=('x86_64')
url="https://github.com/korcankaraokcu/PINCE"
license=('GPL3')
depends=('fuse2' 'hicolor-icon-theme' 'polkit')
provides=('pince')
conflicts=('pince' 'pince-git')
options=('!strip')
source=("PINCE-x86_64-${pkgver}.AppImage::https://github.com/korcankaraokcu/PINCE/releases/download/v${pkgver}/PINCE-x86_64.AppImage")
sha256sums=('d228ad392712866abbc75bc5b2f97b9a113d7f33c08a72c0b176e6a5666b0207')
noextract=("PINCE-x86_64-${pkgver}.AppImage")

prepare() {
    chmod +x "${srcdir}/PINCE-x86_64-${pkgver}.AppImage"
    "${srcdir}/PINCE-x86_64-${pkgver}.AppImage" --appimage-extract
}

package() {
    install -Dm755 "${srcdir}/PINCE-x86_64-${pkgver}.AppImage" "${pkgdir}/opt/pince/PINCE.AppImage"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s /opt/pince/PINCE.AppImage "${pkgdir}/usr/bin/pince"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/PINCE.desktop" "${pkgdir}/usr/share/applications/pince.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/PINCE.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/pince.png"
}
