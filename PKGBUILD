# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="winghexexplorer-bin"
_appname="WingHexExplorer"
pkgver=1.5.5
pkgrel=1
pkgdesc="基于 QT 编写的十六进制编辑器，采用 C++ 进行开发，目的是让 Deepin 上具有强大而免费的十六进制编辑器。"
arch=('x86_64')
url="https://github.com/Wing-summer/WingHexExplorer"
license=('AGPL3')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
depends=('qt5-base' 'qt5-x11extras' 'libglvnd' 'glibc' 'hicolor-icon-theme' 'gcc-libs' 'dtkgui' 'dtkcore' 'dtkwidget')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/com.wingsummer.${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('6d4d3ec3f90e91d3590758597c01eddc1eb1e1dba5e310bbd485f588ffbe9625')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    mv "${pkgdir}/usr/share/applications/com.wingsummer.${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    sed "s|/opt/${_appname}/images/icon.png|${pkgname%-bin}|g" -i "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 32x32 64x64 128x128; do
        install -Dm644 "${pkgdir}/opt/${_appname}/images/winghexpro${_icons/x*}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    mv "${pkgdir}/opt/${_appname}/更新日志.log" "${pkgdir}/opt/${_appname}/ChangeLog.log"
    mv "${pkgdir}/opt/${_appname}/使用说明.txt" "${pkgdir}/opt/${_appname}/ReadMe.txt"
    chmod 644 "${pkgdir}/opt/${_appname}/LICENSE"
}