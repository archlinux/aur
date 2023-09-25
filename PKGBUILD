# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=yuque-pake
_pkgname=YuQue
_appname="com-tw93-${pkgname%-pake}"
pkgver=2.0.0
pkgrel=2
pkgdesc="Use Pake to package YuQue.语雀是一个专业的云端知识库,孵化自蚂蚁集团,已是10万阿里员工进行文档编写、知识沉淀的标配。"
arch=('x86_64')
url="https://www.yuque.com"
_githuburl="https://github.com/tw93/Pake"
license=(custom)
conflicts=("${pkgname%-pake}")
depends=('gcc-libs' 'glib2' 'gtk3' 'gdk-pixbuf2' 'glibc' 'cairo' 'webkit2gtk' 'dbus' 'openssl-1.1' 'pango')
source=("${pkgname}-${pkgver}.deb::${_githuburl}/releases/download/V${pkgver}/${_pkgname}_x86_64.deb"
    "LICENSE.html")
sha256sums=('90e7833f0c29e2ad620e8c322656a164b00b23e5be83c2c9b364bf5b25758d36'
            '0a25a71f3c95a792554e00837ad6cceb7cd2dcef1af3222ab6bed0e9d5f33470')
build() {
    bsdtar -xf "${srcdir}/data.tar.gz"
    sed "s|${_appname}|${pkgname%-pake}|g" -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_appname}" "${pkgdir}/usr/bin/${pkgname%-pake}"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-pake}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-pake}.png"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}