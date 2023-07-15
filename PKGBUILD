# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="chinesechesscontrol-bin"
_pkgname="ChineseChessControl"
_appname="org.Rabbit.${_pkgname%Control}"
pkgver=2.0.8
pkgrel=1
pkgdesc="中国象棋控件,包括中国象棋 MFC 扩展库，中国象棋 activex 控件 ，中国象棋Qt插件，人工智能引擎等"
arch=("x86_64")
url="https://github.com/KangLin/ChineseChessControl"
license=('GPL3')
depends=('openssl' 'sh' 'qt5-multimedia' 'gcc-libs' 'glibc' 'qt5-base' 'qt5-webengine')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_v${pkgver}_Linux_${CARCH}_setup.deb")
sha256sums=('0e0fc6d0fc97b074cc2cd5609478918a50b2787f3ca371d9b80aba1306cff9f4')
package() {
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
    install -Dm644 "${pkgdir}/opt/${_pkgname}/share/pixmaps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    sed "s|${_appname}|${pkgname%-bin}|g" -i "${pkgdir}/opt/${_pkgname}/share/applications/${_appname}.desktop"
    install -Dm644 "${pkgdir}/opt/${_pkgname}/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}