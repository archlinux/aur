# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="diffuse-player-appimage"
pkgver=3.3.0
pkgrel=3
pkgdesc="A music player that connects to your cloud/distributed storage."
arch=('x86_64')
url="https://diffuse.sh/"
_githuburl="https://github.com/icidasset/diffuse"
license=(custom)
depends=('zlib' 'glibc')
options=(!strip)
provides=(icidasset)
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/${pkgver}/${pkgname%-player-appimage}-linux-amd64.AppImage"
    "LICENSE::${_githuburl}/raw/main/LICENSE")
sha256sums=('2daf98d617d871968a33b0f8f78b40247de4c20dc612e8d507af96a314cdb988'
            '22f6e9359127b271eba050bc6e87abc699982ace7a6b386c1c346c7f3154eda8')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|Exec=diffuse|Exec=/opt/appimages/diffuse-player.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-player-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-player-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/1716x1716/apps/${pkgname%-player-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
