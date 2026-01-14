# Maintainer: proivan1711 <ivan.lukan17113@gmail.com>
# Contributor: KillerBossOriginal

pkgname=stayfree-desktop
pkgver=3.2.27
pkgrel=1
pkgdesc="StayFree - Analytics to help you understand and control your pc usage"
arch=('x86_64')
url="https://stayfreeapps.com/"
license=('unknown')
depends=('zlib' 'hicolor-icon-theme' 'fuse2' 'gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'libsecret')
options=('!strip')

_appimage="stayfree-linux-x86_64.AppImage"
source=("${pkgname}-${pkgver}.AppImage::https://github.com/stayfree-app/desktop-releases/releases/download/v${pkgver}/${_appimage}")
sha256sums=('e6878363f9ea048c2ae8ab30cb8b562ee988d03650459a7c3b9c98b2f35d9740')

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
