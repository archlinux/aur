# Maintainer: Keiran <keircn@proton.me>

pkgname=pince-bin
pkgver=0.8
pkgrel=1
pkgdesc="Reverse engineering tool for linux games - front-end/reverse engineering tool for GDB"
arch=('x86_64')
url="https://github.com/korcankaraokcu/PINCE"
license=('GPL3')
depends=('fuse2' 'hicolor-icon-theme' 'polkit')
provides=('pince')
conflicts=('pince' 'pince-git')
options=('!strip')
source=("PINCE-x86_64-${pkgver}.AppImage::https://github.com/korcankaraokcu/PINCE/releases/download/v${pkgver}/PINCE-x86_64.AppImage"
    "pince.desktop")
sha256sums=('f42d5f20977695d02037aa68235e390329dbaa4ed7e99a2e48448fea4be8c939'
            'abe47d7c25930a19beab323430be9db63cda5940233da3436c25f3f9e20b7098')
noextract=("PINCE-x86_64-${pkgver}.AppImage")

prepare() {
    chmod +x "${srcdir}/PINCE-x86_64-${pkgver}.AppImage"
    "${srcdir}/PINCE-x86_64-${pkgver}.AppImage" --appimage-extract
}

package() {
    install -Dm755 "${srcdir}/PINCE-x86_64-${pkgver}.AppImage" "${pkgdir}/opt/pince/PINCE.AppImage"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s /opt/pince/PINCE.AppImage "${pkgdir}/usr/bin/pince"
    install -Dm644 "${srcdir}/pince.desktop" "${pkgdir}/usr/share/applications/pince.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/PINCE.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/pince.png"
}
