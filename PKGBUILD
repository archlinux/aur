# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=chinesechess-bin
_appname=ChineseChess
pkgver=6.1
pkgrel=4
pkgdesc='Cross-platform and online battle platform game based on Qt: Chinese Chess. Also known as:"Xiangqi" "中国象棋"'
arch=('x86_64')
url="https://github.com/XMuli/ChineseChess"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('qt5-multimedia' 'hicolor-icon-theme' 'glibc' 'qt5-base' 'gcc-libs')
makedepends=('gendesk')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}-1_amd64.deb"
        "${pkgname%-bin}.svg::${url}/raw/master/images/chess.svg")
sha256sums=('9ace9190fdac8f9d0f8571b7079e37a9c60babf7ecfe3cc7fc3d5b7fcddbb3e2'
            '416d818b788cdd93fc33d50aa796d1e092ec8fda1fc3ff8c42e50d945627fb97')
package() {
    bsdtar -xvf data.tar.xz -C "${pkgdir}"
    install -d "${pkgdir}/opt/apps/${pkgname%-bin}"
    mv "${pkgdir}/usr/bin/${_appname}" "${pkgdir}/opt/apps/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    gendesk -f -n --name="${_appname}" --icon="${pkgname%-bin}" --categories="Game"  --exec="/opt/apps/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    rm -rf "${pkgdir}/usr/bin"
}