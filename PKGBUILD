# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="pdmaner-appimage"
pkgver=4.5.1
pkgrel=2
pkgdesc="A multi operating system open source and free desktop version relational database modeling tool.一款多操作系统开源免费的桌面版关系数据库模型建模工具"
arch=("x86_64")
url="http://www.pdmaner.com"
_downurl="https://github.com/zxp19821005/My_AUR_Files"
license=(custom:MulanPubL-2.0)
depends=('zlib' 'glibc')
options=(!strip)
provides=("${pkgname%-appimage}")
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_downurl}/releases/download/v${pkgver}/PDManer-linux_v${pkgver}.AppImage"
    "LICENSE::https://gitee.com/robergroup/pdmaner/raw/master/LICENSE")
sha256sums=('3808d1508b5aa6504a8576e9541d3b68db5da94d615dcc1bb3a4b86bfd259344'
            '05eec509c11d99970dc4ca5bed4aae992960fd7f168e1746089c49643a18f461')
        
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/pdmaner.AppImage|g;s|Utility|Utility;Development|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}