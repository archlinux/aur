# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="memocast-appimage"
_appname="cn.memocast.app"
pkgver=2.2.3
pkgrel=1
pkgdesc="Yet another elegant Wiz Note Client, which was built with Quasar UI Framework and based on Electron."
arch=('x86_64')
url="https://tanknee.github.io/Memocast"
_githuburl="https://github.com/TankNee/Memocast"
license=('MIT')
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Memocast-${pkgver}-x86_64-linux.AppImage"
    "LICENSE::https://raw.githubusercontent.com/TankNee/Memocast/master/LICENSE")
sha256sums=('e90d0beb421af2f054df4f839ec9fa6916fb2c1a6d32538d426e399892979944'
            '09141f28d3723a64b16c54cbecd3b239301c879fc2f229dd70528cf75878b812')

prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/memocast.AppImage|g;s|cn.memocast.app|memocast|g' -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
 
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-appimage}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}