# Maintainer: Keiran <keircn@proton.me>

pkgname=pince-bin
pkgver=0.9.3
pkgrel=0
pkgdesc="Reverse engineering tool for linux games - front-end/reverse engineering tool for GDB"
arch=('x86_64')
url="https://github.com/korcankaraokcu/PINCE"
license=('GPL3')
depends=('fuse2' 'hicolor-icon-theme' 'polkit')
provides=('pince')
conflicts=('pince' 'pince-git')
options=('!strip')
source=(PINCE-x86_64-0.9.2.AppImage::https://github.com/korcankaraokcu/PINCE/releases/download/v0.9.2/PINCE-x86_64.AppImage)
sha256sums=('bcca7eb85f7cc834571764fa3ad39a3fc132608ae24b0f0c40ddf8b2cfc34c28')
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
