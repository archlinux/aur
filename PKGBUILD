# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=listera-novelreader-bin
pkgver=1.2.1
pkgrel=9
pkgdesc="A txt Chinese novel reader, developed based on Qt5 and Dtk5.(Prebuilt version)一个 txt 中文小说阅读器，基于 Qt5 和 Dtk5 开发"
arch=('x86_64')
url="https://www.listera.top/tag/novelreader"
_giteeurl="https://gitee.com/lidanger/listera-novelreader"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'dtkwidget'
    'dtkcore'
    'qt5-base'
    'dtkgui'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_giteeurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}-3_amd64.deb"
)
sha256sums=('74fda48d298a908db84ba2f945c2d72cfc3a8eb7ee4696a3f619f1060dd78ef7')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.gz"
    sed -i -e "
        s/\/usr\/bin\/${pkgname%-bin}/${pkgname%-bin}/g
        s/Viewer/Utility;Office/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/${pkgname%-bin}/translations/${pkgname%-bin}_zh_CN.qm" -t "${pkgdir}/usr/share/${pkgname%-bin}/translations/"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/128x128/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}