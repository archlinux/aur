# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pdmaner-bin
_appname=PDManer
pkgver=4.6.2
pkgrel=1
pkgdesc="A multi operating system open source and free desktop version relational database modeling tool.一款多操作系统开源免费的桌面版关系数据库模型建模工具"
arch=("x86_64")
url="http://www.pdmaner.com"
_downurl="https://github.com/zxp19821005/My_AUR_Files"
license=("MPL2")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron13' 'java-runtime')
source=("${pkgname%-bin}-${pkgver}.AppImage::${_downurl}/releases/download/v${pkgver}/${_appname}-linux_v${pkgver}.AppImage"
    "LICENSE::https://gitee.com/robergroup/pdmaner/raw/master/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('5bf70f02f950d653820bfaf17460f3c472a25385a5dcc8f813052cd1e0be1be1'
            '05eec509c11d99970dc4ca5bed4aae992960fd7f168e1746089c49643a18f461'
            'ff82429b6f757ef0e138d6079b27d7e282d41e12a7ad9c9577a40d580db52acf')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    sed "s|AppRun --no-sandbox %U|opt/${pkgname%-bin}/${pkgname%-bin}|g;s|Utility|Utility;Development|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    find "${pkgdir}/opt/${pkgname%-bin}" -type d -exec chmod 755 {} \;
}