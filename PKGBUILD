# Maintainer: Bailey Harrison (bailwillharr) <baileyharrison04@outlook.com>
# Contributor: KillerBossOriginal

pkgname=stayfree-desktop
pkgver=3.4.0
pkgrel=1
pkgdesc="StayFree - Analytics to help you understand and control your pc usage"
arch=('x86_64')
url="https://stayfreeapps.com/"
license=('unknown')
depends=('zlib' 'hicolor-icon-theme' 'fuse2' 'gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'libsecret')
options=('!strip')

_appimage="stayfree-linux-x86_64.AppImage"
source=("${pkgname}-${pkgver}.AppImage::https://github.com/stayfree-app/desktop-releases/releases/download/v${pkgver}/${_appimage}")
sha256sums=('7a343a61560c9396dbceff8879ca0d10a2c4eddc14ca628b2e47b244e4d2b417')

prepare() {
    chmod +x "${pkgname}-${pkgver}.AppImage"
    ./"${pkgname}-${pkgver}.AppImage" --appimage-extract
}

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/usr/bin/stayfree"

    install -Dm644 "${srcdir}/squashfs-root/stayfree-desktop.desktop" "${pkgdir}/usr/share/applications/stayfree-desktop.desktop"
    
    sed -i 's|Exec=AppRun|Exec=/usr/bin/stayfree|' "${pkgdir}/usr/share/applications/stayfree-desktop.desktop"

    install -Dm644 "${srcdir}/squashfs-root/stayfree-desktop.png" "${pkgdir}/usr/share/pixmaps/stayfree-desktop.png"
}
