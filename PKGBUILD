# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="winggifeditor-bin"
_appname="com.wingsummer.${pkgname%-bin}"
pkgver=1.1.2
pkgrel=1
pkgdesc="基于 QT 编写的 GIF 编辑器，采用 C++ 进行开发"
arch=('x86_64')
url="https://github.com/Wing-summer/WingGifEditor"
license=('AGPL3')
options=()
conflicts=("${pkgname%-bin}")
depends=('qt5-base' 'qt5-x11extras' 'libglvnd' 'glibc' 'gcc-libs' 'dtkcore' 'dtkgui' 'dtkwidget')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/V${pkgver}/com.wingsummer.winggifeditor_${pkgver}_amd64.deb")
sha256sums=('c2e56a4478a7540afa7d52819d37e9d6b30d7afb577002dd3825b928d83125b2')
package() {
    bsdtar -xvf data.tar.xz -C "${pkgdir}"
    mv "${pkgdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    sed 's|WingHexExplorer|WingGifEditor|g;s|/opt/WingGifEditor/images/icon.png|winggifeditor|g' -i "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${pkgdir}/opt/WingGifEditor/images/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    mv "${pkgdir}/opt/WingGifEditor/更新日志.log" "${pkgdir}/opt/WingGifEditor/ChangeLog.log"
    chmod 644 "${pkgdir}/opt/WingGifEditor/LICENSE"
}