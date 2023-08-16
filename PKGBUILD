# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mechakeys-appimage
_appname=MechaKeys
pkgver=2.0.6
pkgrel=2
pkgdesc="An integrated typing environment, a collection of interconnected customization tools built around your keyboard and mouse."
arch=('x86_64')
url="https://v2.robolab.io"
_githuburl="https://github.com/robolab-io/mechakeys-distro"
license=('custom')
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${_appname}-${pkgver}.AppImage"
    "LICENSE.html::${url}/terms")
sha256sums=('ba45cb02a9cf9ccef4842768b612d42cf11c82dc22e94a860364975abd60f74b'
            '04d6d6a6e5f277ec57b1365e94c56d39e00f4792cec45254cc1cc1ac8b73727a')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    1install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}