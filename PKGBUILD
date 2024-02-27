# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=yuque-pake
_pkgname=YuQue
_appname="com-tw93-${pkgname%-pake}"
pkgver=2.0.0
pkgrel=3
pkgdesc="Use Pake to package YuQue.语雀是一个专业的云端知识库,孵化自蚂蚁集团,已是10万阿里员工进行文档编写、知识沉淀的标配。"
arch=('x86_64')
url="https://www.yuque.com"
_ghurl="https://github.com/tw93/Pake"
license=('MIT')
conflicts=("${pkgname%-pake}")
depends=(
    'gtk3'
    'webkit2gtk'
    'openssl-1.1'
)
source=(
    "${pkgname}-${pkgver}.deb::${_ghurl}/releases/download/V${pkgver}/${_pkgname}_x86_64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/tw93/Pake/V${pkgver}/LICENSE"
)
sha256sums=('90e7833f0c29e2ad620e8c322656a164b00b23e5be83c2c9b364bf5b25758d36'
            'a8cfae3105018e6018e5a046977a9919c0e975d8d5eab79fd19339182211f058')
build() {
    bsdtar -xf "${srcdir}/data."*
    sed "s|${_appname}|${pkgname%-pake}|g" -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_appname}" "${pkgdir}/usr/bin/${pkgname%-pake}"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-pake}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-pake}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}