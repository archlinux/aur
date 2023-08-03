# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=eusoft-ting-en-bin
_appname=ting_en
pkgver=9.6.2.114
pkgrel=1
pkgdesc="听力统计、笔记同步、语音高亮跟随，让您轻松愉快学英语"
arch=('x86_64')
url="http://dict.eudic.net/ting"
license=('custom')
conflicts=("${pkgname%-bin}" "eudic-${_appname}")
depends=('hicolor-icon-theme' 'bash' 'electron13')
source=("${pkgname%-bin}-${pkgver}.deb::https://static.frdic.com/pkg/${_appname}/${_appname}.deb"
    "LICENSE.html"
    "${pkgname%-bin}.sh")
sha256sums=('47b4bd3aa25299fa835f7141e370aa679f938ce573a367418ad2d4ac2aa3a99c'
            '17651cf7ae49b0372b6b6812d8b3b066203892c9fbe0b04b25efec0ab038c12b'
            'fd5f52fe0bf371c88644c112b935b607c9f7357d717e1fc835d258c0aa912d19')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/opt/每日英语听力/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    sed "s|\"/opt/每日英语听力/${_appname}\" %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|Icon=${_appname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_appname}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 32x32 128x128 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}