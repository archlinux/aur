# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=glimboi-bin
_appname=GlimBoi
pkgver=2.7.6
pkgrel=4
pkgdesc="A chatbot for Glimesh.tv"
arch=("x86_64")
url="https://glimboi.com/"
_githuburl="https://github.com/aMytho/GlimBoi"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('electron18' 'bash')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/aMytho/GlimBoi/main/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('69006428124c19401c663a1848a6e0c1190e4f778641ceab2bb63de41092cef6'
            '0a1fcb16cfedd24007679bc30fc10294f89a479a466adb1a2a0aa77f63dfc755'
            'defa302b907a7da8610613d16abc908545a34ea3c6fe2d67ed73da985644dd88')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    asar e "${srcdir}/opt/${_appname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${_appname}.png" "${srcdir}/app.asar.unpacked/resources/Icons/icon.png"
    asar p "${srcdir}/app.asar.unpacked" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    sed "s|/opt/${_appname}/${_appname} %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|Icon=${_appname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_appname}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}