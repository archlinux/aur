# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=eusoft-ting-es-bin
_appname=ting_es
pkgver=9.6.2.114
pkgrel=1
pkgdesc="听力统计、笔记同步、语音高亮跟随，让您轻松愉快学西班牙语"
arch=('x86_64')
url="https://www.esdict.cn/ting"
license=('custom')
conflicts=("${pkgname%-bin}" "eudic-${_appname}" "${_appname}")
depends=('hicolor-icon-theme' 'bash' 'electron13')
source=("${pkgname%-bin}-${pkgver}.deb::https://static.frdic.com/pkg/${_appname}/${_appname}.deb"
    "LICENSE.html"
    "${pkgname%-bin}.sh")
sha256sums=('73e57df6718460a282ec4bd3d6aea59f78d6097b829b8516f8ab7075e81e981f'
            'bb199c3faf0e1155a5bc43512e1898e6604034a67d9e2f4d16840b3b359cc432'
            '3420da4b46178952b73d7b4ec1023e3005490269158ea5066e1a6709db5714ff')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/opt/每日西语听力/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    sed "s|\"/opt/每日西语听力/${_appname}\" %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|Icon=${_appname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_appname}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 32x32 128x128 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}