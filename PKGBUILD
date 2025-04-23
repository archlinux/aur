# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=chinesechess-bin
_pkgname=ChineseChess
_zhsname='中国象棋'
pkgver=6.1
pkgrel=12
pkgdesc='Cross-platform and online battle platform game based on Qt: Chinese Chess. Also known as:"Xiangqi" "中国象棋".(Prebuilt version)'
arch=('x86_64')
url="https://github.com/XMuli/ChineseChess"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'qt5-multimedia'
    'qt5-base'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}-1_amd64.deb"
    "${pkgname%-bin}-${pkgver}.svg::https://raw.githubusercontent.com/XMuli/ChineseChess/v${pkgver}/images/chess.svg"
)
sha256sums=('9ace9190fdac8f9d0f8571b7079e37a9c60babf7ecfe3cc7fc3d5b7fcddbb3e2'
            '416d818b788cdd93fc33d50aa796d1e092ec8fda1fc3ff8c42e50d945627fb97')
prepare() {
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --name="${_pkgname}" \
        --categories="Game"  \
        --exec "${pkgname%-bin}"
    sed -i "3i\Name[zh_CN]=${_zhsname}" "${srcdir}/${pkgname%-bin}.desktop"
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}