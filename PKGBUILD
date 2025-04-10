# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=minedigger-bin
_pkgname=MineDigger
pkgver=1.0
pkgrel=9
pkgdesc="Simple match-3 game prototype.(Prebuilt version)"
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
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.tgz::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_linux64.tgz"
    "${pkgname%-bin}.png"
    "${pkgname%-bin}.sh"
)
sha256sums=('8d88a7a1d9d4547789f9f828632aca4273e09ca72799c4c7238af3e850d3b1ae'
            'e544a0f449e2e13fd4d5367d1ae4bcf9dd85c93cf9057189477bc282c4b5fff0'
            '66ba0a42698a2815cfec1c2a5a2b459e4ea9c054481c859acf5dd4aa84d49ce8')
build() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -f -n -q \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Game" \
        --name="${_pkgname}" \
        --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${_pkgname}_release" "${pkgdir}/usr/lib/${pkgname%-bin}/${_pkgname}"
    install -Dm644 "${srcdir}/res/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/res"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm755 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}