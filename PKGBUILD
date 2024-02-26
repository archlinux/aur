# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=minedigger-bin
_pkgname=MineDigger
pkgver=1.0
pkgrel=5
pkgdesc="Simple match-3 game prototype for Linux, Windows and Android"
arch=('x86_64')
url="https://play.google.com/store/apps/details?id=com.neodesys.minedigger"
_ghurl="https://github.com/neodesys/MineDigger"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'sdl2'
    'sdl2_image'
    'sdl2_mixer'
    'sdl2_ttf'
)
source=(
    "${pkgname%-bin}-${pkgver}.tgz::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_linux64.tgz"
    "${pkgname%-bin}.png"
    "${pkgname%-bin}.sh"
)
sha256sums=('8d88a7a1d9d4547789f9f828632aca4273e09ca72799c4c7238af3e850d3b1ae'
            'e544a0f449e2e13fd4d5367d1ae4bcf9dd85c93cf9057189477bc282c4b5fff0'
            'a9783526d93e6c72c7e1551cc5cc513fd6056dcc4593abe8fac815721d32dd5a')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_pkgname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -f -n -q --categories="Game" --name ="${_pkgname}" --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${_pkgname}_release" "${pkgdir}/opt/${pkgname%-bin}/${_pkgname}"
    install -Dm644 "${srcdir}/res/"* -t "${pkgdir}/opt/${pkgname%-bin}/res"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm755 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}