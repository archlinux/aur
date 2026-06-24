# Maintainer: Keiran <keircn@proton.me>

pkgname=pince-bin
pkgver=0.9
pkgrel=2
pkgdesc="Reverse engineering tool for linux games - front-end/reverse engineering tool for GDB"
arch=('x86_64')
url="https://github.com/korcankaraokcu/PINCE"
license=('GPL3')
depends=('fuse2' 'hicolor-icon-theme' 'polkit')
provides=('pince')
conflicts=('pince' 'pince-git')
options=('!strip')
source=("PINCE-x86_64-${pkgver}.AppImage::https://github.com/korcankaraokcu/PINCE/releases/download/v${pkgver}/PINCE-x86_64.AppImage")
sha256sums=('dcd94df5e43765e4e8f33e938dfaa118e22cf18b6f91088ec16e6c5c655a4973')
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
