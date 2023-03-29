# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=yuque
pkgname="unoffical-${_pkgname}-appimage"
_appname="com-tw93-${_pkgname}"
pkgver=1.0.8
pkgrel=1
pkgdesc="Unoffical YuQue Appimage Client.语雀是一个专业的云端知识库,孵化自蚂蚁集团,已是10万阿里员工进行文档编写、知识沉淀的标配。"
arch=('x86_64')
url="https://www.yuque.com/"
_githuburl="https://github.com/tw93/Pake"
license=(custom)
conflicts=("${_pkgname}-pake")
depends=(hicolor-icon-theme zlib glibc)
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/V${pkgver}/YuQue_x86_64.AppImage"
    "LICENSE.html::https://www.yuque.com/terms")
sha256sums=('33c5ce8aac5b05b5bc35dda19d793a2002f6c70dc0c28b4612a5ba562e2f3577'
            'c27442b711aea30ac31f6966742fbc57278b159174d0dd8c15e999da993bafe0')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/Exec=com-tw93-yuque/Exec=\/opt\/appimages\/yuque.AppImage/g;s/Icon=com-tw93-yuque/Icon=yuque/g;s/Name=com-tw93-yuque/Name=语雀YuQue/g;s/Development/Utility/g' \
        -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
          
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${_appname}.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/LICENSE.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
}