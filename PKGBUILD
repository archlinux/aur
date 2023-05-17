# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="goofcord-appimage"
pkgver=0.5.1
pkgrel=1
pkgdesc="Take control of your Discord experience with GoofCord – the highly configurable and privacy first discord client."
arch=('x86_64')
url="https://github.com/Milkshiift/GoofCord"
license=("custom:OSL3")
depends=('zlib' 'glibc')
options=(!strip)
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/GoofCord-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/Milkshiift/GoofCord/main/LICENSE")
sha256sums=('20a38422e837acb873d65fa963f0dd233fcc9d5f0dde5859d60aa328289e91fe'
            '4e7f66aa93929feee2db20f14f871e7ddcc69236b0ecfb79a19ade9b859daf51')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|Exec=diffuse|Exec=/opt/appimages/goofcord.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}