# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mootool-bin
_pkgname=MooTool
pkgver=1.6.9
pkgrel=1
pkgdesc="Handy tool set for developers.(Prebuilt version)开发者常备小工具"
arch=('x86_64')
url="https://github.com/rememberber/MooTool"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'alsa-lib'
    'libxtst'
    'libxrender'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}.rpm"
    "LICENSE-${pkgver}.txt::https://raw.githubusercontent.com/rememberber/MooTool/v${pkgver}/LICENSE.txt"
    "${pkgname%-bin}.sh"
)
sha256sums=('451899d10d2accff1bef2bffc3d4fbaa25222c75e9d87c05747291fc931624f7'
            '91930d61ff6e2bd3ceaf0ac0de4431d4ede9a9a940ca327367820df54762e333'
            '74b5601e17710cdf781ec411f54075c2c477370fdc317ff75c18bdae0662b498')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i -e "
        s/\/opt\/${_pkgname}\/${_pkgname} %U/${pkgname%-bin} %U/g
        s/\/opt\/${_pkgname}\/${_pkgname}.png/${pkgname%-bin}/g
        s/Categories=Utility/Categories=Development;/g
    " "${srcdir}/opt/${_pkgname}/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/${_pkgname}/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
