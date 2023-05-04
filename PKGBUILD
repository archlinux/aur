# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="yuque-pake"
_appname="com-tw93-yuque"
pkgver=2.0.0
pkgrel=1
pkgdesc="Use Pake to package YuQue.语雀是一个专业的云端知识库,孵化自蚂蚁集团,已是10万阿里员工进行文档编写、知识沉淀的标配。"
arch=('x86_64')
url="https://www.yuque.com"
_githuburl="https://github.com/tw93/Pake"
license=(custom)
conflicts=("${pkgname%-pake}")
depends=('hicolor-icon-theme' 'gcc-libs' 'glib2' 'gtk3' 'gdk-pixbuf2' 'glibc' 'cairo' 'webkit2gtk' 'dbus' 'openssl-1.1')
source=("${pkgname}-${pkgver}.deb::${_githuburl}/releases/download/V${pkgver}/YuQue_x86_64.deb"
    "LICENSE.html::${url}/terms")
sha256sums=('90e7833f0c29e2ad620e8c322656a164b00b23e5be83c2c9b364bf5b25758d36'
            '0635a9ca44c5fbe4670237c96c318b87b11d6431fe4f86a1db62fa80d0bda190')
package() {
    bsdtar -xvf data.tar.gz -C "${pkgdir}" --gname root --uname root
    install -Dm755 -d "${pkgdir}/opt/apps/${pkgname%-pake}"
    mv "${pkgdir}/usr/bin/${_appname}" "${pkgdir}/opt/apps/${pkgname%-pake}/${pkgname%-pake}"
    rm -rf "${pkgdir}/usr/share/applications" "${pkgdir}/usr/bin"
    gendesk -f --icon "${pkgname%-pake}" --categories "Utility" --name "语雀YuQue" --exec "/opt/apps/${pkgname%-pake}/${pkgname%-pake}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    mv "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_appname}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-pake}.png"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}