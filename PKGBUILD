# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=eusoft-ting-fr-bin
_appname=ting_fr
pkgver=9.6.2.114
pkgrel=1
pkgdesc="听力统计、笔记同步、语音高亮跟随，让您轻松愉快学法语"
arch=('x86_64')
url="https://www.frdic.com/ting"
license=('custom')
conflicts=("${pkgname%-bin}" "eudic-${_appname}" "${_appname}")
depends=('hicolor-icon-theme' 'bash' 'electron13')
source=("${pkgname%-bin}-${pkgver}.deb::https://static.frdic.com/pkg/${_appname}/${_appname}.deb"
    "LICENSE.html"
    "${pkgname%-bin}.sh")
sha256sums=('efbf72d55838f72fe4992330092473416476bb32ab6a0d03135aff64f99e74c9'
            '69031e95591a339c4cd9c01547494e23196cea6438608f1f951b493ea8fca54f'
            '910f1727b3603b7e2f25033c0a9e071422a94918a8d8a63fc93522b2fabb6eef')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/opt/每日法语听力/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    sed "s|\"/opt/每日法语听力/${_appname}\" %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|Icon=${_appname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_appname}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 32x32 128x128 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}