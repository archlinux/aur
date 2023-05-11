# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=monit-appimage
pkgver=0.8.0
pkgrel=1
pkgdesc="展示各种信息的桌面小组件"
arch=('x86_64')
url="https://monit.fzf404.art/"
_githuburl="https://github.com/fzf404/Monit"
license=('MIT')
options=(!strip)
conflits=()
depends=('zlib' 'glibc' 'hicolor-icon-theme')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Monit-${pkgver}-linux-x86_64.AppImage"
    "LICENSE::https://raw.githubusercontent.com/fzf404/monit/main/LICENSE")
sha256sums=('b9bf71dcaccbea4b50ba691fa3628b2ab4b08cc3c4d2d648f6af667d48be81a4'
            'a1d101c81e481ecb6e5ded277789b4fb293b489ac9d75953a18b37223ccb3709')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/monit.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
    
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}