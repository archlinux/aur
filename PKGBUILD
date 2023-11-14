# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=game_box
pkgname="${_pkgname//_/-}-bin"
pkgver=0.1.0
pkgrel=5
pkgdesc="An Old-gen console games emulator. This project only relies on the Qt framework.一款游戏家用机模拟器,仅依赖Qt框架"
arch=('x86_64')
url="https://github.com/QQxiaoming/game_box"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=('!strip')
depends=(
    'freetype2'
    'e2fsprogs'
    'fontconfig'
    'libxcb'
    'libx11'
    'libgpg-error'
    'libdrm'
    'mesa'
    'libglvnd'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/V${pkgver}/${_pkgname}_ubuntu2004_V${pkgver//./}_${CARCH}.tar.gz"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/QQxiaoming/game_box/V${pkgver}/img/icon256.png"
)
sha256sums=('f031db78f85ea318b17fd617823fa512990cf29879ed01a7989a88094130933e'
            '8410145a23e7c9bd51ada0ac251783079903ab8c3de44c500cf05f91b9745fac')
build() {
    gendesk -q -f -n --pkgname "${_pkgname//_/-}-bin" --categories "Game" --name "${pkgname%-bin}" --exec "${pkgname%-bin} %F"
}
package() {
    install -Dm 755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/${_pkgname}_ubuntu2004/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${_pkgname}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}