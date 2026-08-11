# Maintainer: Keiran <keircn@proton.me>

pkgname=pince-bin
pkgver=0.10.1
pkgrel=1
pkgdesc="Reverse engineering tool for linux games - front-end/reverse engineering tool for GDB"
arch=('x86_64')
url="https://github.com/korcankaraokcu/PINCE"
license=('GPL3')
depends=('fuse2' 'hicolor-icon-theme' 'polkit')
provides=('PINCE')
conflicts=('pince' 'pince-git')
options=('!strip')
source=(PINCE-x86_64-${pkgver}.AppImage::https://github.com/korcankaraokcu/PINCE/releases/download/v${pkgver}/PINCE-x86_64.AppImage)
sha256sums=('b671d20148709b0c64e02e1ca394fa1a0633f63867ab7f733d781d82a367cf9e')
noextract=("PINCE-x86_64-${pkgver}.AppImage")

prepare() {
    chmod +x "${srcdir}/PINCE-x86_64-${pkgver}.AppImage"
    "${srcdir}/PINCE-x86_64-${pkgver}.AppImage" --appimage-extract
}

package() {
    install -Dm755 "${srcdir}/PINCE-x86_64-${pkgver}.AppImage" "${pkgdir}/opt/PINCE/PINCE.AppImage"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s /opt/PINCE/PINCE.AppImage "${pkgdir}/usr/bin/PINCE"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/PINCE.desktop" "${pkgdir}/usr/share/applications/PINCE.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/PINCE.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/PINCE.png"
}
