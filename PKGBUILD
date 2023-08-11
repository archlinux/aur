# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=eusoft-ting-de-bin
_appname=ting_de
pkgver=9.6.2.114
pkgrel=1
pkgdesc="听力统计、笔记同步、语音高亮跟随，让您轻松愉快学德语"
arch=('x86_64')
url="https://www.godic.net/ting"
license=('custom')
conflicts=("${pkgname%-bin}" "eudic-${_appname}" "${_appname}")
depends=('hicolor-icon-theme' 'bash' 'electron13')
source=("${pkgname%-bin}-${pkgver}.deb::https://static.frdic.com/pkg/${_appname}/${_appname}.deb"
    "LICENSE.html"
    "${pkgname%-bin}.sh")
sha256sums=('3bf27e84f6b6f65aad0bbb45b8602afb9124cd2539c62406d9b9c8f2bfa7249d'
            'ca6b558863398cad1363bf850881d318dac47866dc2ba75353364c0de5615525'
            '90feda5963c1cc18a874b384e55c1e5a1f0efd737b8378f6caa89c90f2e44960')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/opt/每日德语听力/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    sed "s|\"/opt/每日德语听力/${_appname}\" %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|Icon=${_appname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_appname}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 32x32 128x128 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}