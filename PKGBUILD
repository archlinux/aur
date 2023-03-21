
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=chinesechess
pkgname="${_pkgname}-bin"
pkgver=6.1
pkgrel=1
pkgdesc="Cross-platform and online battle platform game based on Qt: Chinese Chess. Also known as:"Xiangqi" "中国象棋""
arch=('x86_64')
url="https://github.com/XMuli/ChineseChess"
license=('GPL3')
options=()
conflicts=(chinesechess)
depends=(qt5-multimedia hicolor-icon-theme glibc qt5-base gcc-libs)
source=("${_pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}-1_amd64.deb"
        "${_pkgname}.svg::${url}/raw/master/images/chess.svg")
sha256sums=('9ace9190fdac8f9d0f8571b7079e37a9c60babf7ecfe3cc7fc3d5b7fcddbb3e2'
            '416d818b788cdd93fc33d50aa796d1e092ec8fda1fc3ff8c42e50d945627fb97')
package() {
    bsdtar -xvf data.tar.xz -C "${pkgdir}"
    install -d "${pkgdir}/opt/apps/${_pkgname}"
    mv "${pkgdir}/usr/bin/ChineseChess" "${pkgdir}/opt/apps/${_pkgname}/${_pkgname}"
    rm -r "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${_pkgname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
    gendesk -f -n --pkgname "${_pkgname}" --name="${_pkgname}" --comment="Chinese Chess 中国象棋" \
            --icon="${_pkgname}" --categories="Game;"  --exec="/opt/apps/${_pkgname}/${_pkgname}"
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}