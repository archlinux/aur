# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=yuque
pkgname="unoffical-${_pkgname}-appimage"
_appname="com-tw93-${_pkgname}"
pkgver=2.0.0alpha
_pkgver=2.0.0-alpha
pkgrel=1
pkgdesc="Unoffical YuQue Appimage Client.语雀是一个专业的云端知识库,孵化自蚂蚁集团,已是10万阿里员工进行文档编写、知识沉淀的标配。"
arch=('x86_64')
url="https://www.yuque.com/"
_githuburl="https://github.com/tw93/Pake"
license=(custom)
conflicts=("${_pkgname}-pake")
depends=('hicolor-icon-theme' 'zlib' 'glibc')
_install_path="/opt/appimages"
source=("${_pkgname}-${_pkgver}.AppImage::${_githuburl}/releases/download/V${_pkgver}/YuQue_x86_64.AppImage"
    "LICENSE.html::https://www.yuque.com/terms")
sha256sums=('1720929818fda58b7c4a653710779c48ff6a536ecf9666beb42e84eb073195fe'
            'c5cfbf7a5599bdbc948e392a23cb63f9f1c4c083f9a9f6c8f9a900f886ec7eb4')
prepare() {
    chmod a+x "${_pkgname}-${_pkgver}.AppImage"
    "./${_pkgname}-${_pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|Exec=com-tw93-yuque|Exec=/opt/appimages/yuque.AppImage|g;s|Icon=com-tw93-yuque|Icon=yuque|g;s|Name=com-tw93-yuque|Name=语雀YuQue|g;s|Development|Utility|g' \
        -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
          
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${_pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${_appname}.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}