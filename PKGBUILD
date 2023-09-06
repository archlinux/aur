# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=winggifeditor-bin
_pkgname=WingGifEditor
_appname="com.wingsummer.${pkgname%-bin}"
pkgver=1.1.2
pkgrel=2
pkgdesc="基于 QT 编写的 GIF 编辑器，采用 C++ 进行开发"
arch=('x86_64')
url="https://github.com/Wing-summer/WingGifEditor"
license=('AGPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('qt5-base' 'qt5-x11extras' 'libglvnd' 'glibc' 'gcc-libs' 'dtkcore' 'dtkgui' 'dtkwidget')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/V${pkgver}/${_appname}_${pkgver}_amd64.deb")
sha256sums=('c2e56a4478a7540afa7d52819d37e9d6b30d7afb577002dd3825b928d83125b2')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|\"/opt/${_pkgname}/${_pkgname}\"|${pkgname%-bin}|g;s|/opt/${_pkgname}/images/icon.png|${pkgname%-bin}|g;s|WingHexExplorer|${_pkgname}|g" \
        -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/opt/${_pkgname}/${_pkgname}" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/lang/default.qm" -t "${pkgdir}/opt/${pkgname%-bin}/lang"
    install -Dm644 "${srcdir}/opt/${_pkgname}/images/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}