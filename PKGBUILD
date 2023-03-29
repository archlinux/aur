# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=yuque
pkgname="${_pkgname}-pake"
_appname="com-tw93-${_pkgname}"
pkgver=1.0.8
pkgrel=1
pkgdesc="Use Pake to package YuQue.语雀是一个专业的云端知识库,孵化自蚂蚁集团,已是10万阿里员工进行文档编写、知识沉淀的标配。"
arch=('x86_64')
url="https://www.yuque.com/"
_githuburl="https://github.com/tw93/Pake"
license=(custom)
conflicts=("${_pkgname}")
depends=(hicolor-icon-theme gcc-libs glib2 pango gtk3 gdk-pixbuf2 glibc cairo webkit2gtk)
source=("${pkgname}-${pkgver}.deb::${_githuburl}/releases/download/V${pkgver}/YuQue_x86_64.deb"
    "LICENSE.html::https://www.yuque.com/terms")
sha256sums=('4581c26335e553f1ec6b34df28a0c94505f5e8a566ac554cddb448ecddc0b1a6'
            '3571161a9cc9d07d7ac85aed7d88b953b091a7ca7bb837b6b0580365afef9b7c')
package() {
    bsdtar -xvf data.tar.gz -C "${pkgdir}" --gname root --uname root
    install -Dm755 -d "${pkgdir}/opt/apps/${_pkgname}"
    mv "${pkgdir}/usr/bin/${_appname}" "${pkgdir}/opt/apps/${_pkgname}/${_pkgname}"
    rm -rf "${pkgdir}/usr/share/applications" "${pkgdir}/usr/bin"
    gendesk -f --pkgname "${_pkgname}" --pkgdesc "语雀是一个专业的云端知识库,孵化自蚂蚁集团,已是10万阿里员工进行文档编写、知识沉淀的标配。" \
        --icon "${_pkgname}" --categories "Utility" --name "语雀YuQue" --exec "/opt/apps/${_pkgname}/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    mv "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_appname}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/LICENSE.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
}