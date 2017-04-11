# Maintainer: Dan Beste <dan.ray.beste@gmail.com>
# Thanks to: Ainola for the base PKGBUILD (gog-undertale)

pkgname=gog-yooka-laylee
pkgver=2.0.0.1
pkgrel=1
pkgdesc="Yooka-Laylee is an all-new open-world platformer from key creative talent behind the Banjo-Kazooie and Donkey Kong Country games!"
url="http://www.playtonicgames.com/games/yooka-laylee/"
license=('custom')
arch=('i686' 'x86_64')
depends=('sdl2')
optdepends=('firejail: Automatically sandbox this application from your OS')
source=(
    "gog://${pkgname//-/_}_${pkgver}.sh"
    "${pkgname}.desktop"
    "${pkgname}"
)
sha256sums=(
    'SKIP'
    'eab3d609d3146cb69b32e9b9c894164323c3eab45628a33e9d1e6e75cd9ebbca'
    '4e4c5428a1d929007fea2204b688a4dcd97a13c992b5f92a0c7866f11adc8adc'
)
DLAGENTS=(
    "gog::/usr/bin/echo %u Download the GOG file to $PWD or set up a gog:// DLAGENT."
)

package(){
    cd "${srcdir}"

    # Install game
    install -d "${pkgdir}/opt/${pkgname}/"
    install -d "${pkgdir}/opt/${pkgname}/support"
    install -d "${pkgdir}/usr/bin/"
    cp -r "data/noarch/game/" "${pkgdir}/opt/${pkgname}/"
    
    find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} \;
    install -Dm755 "data/noarch/start.sh" "${pkgdir}/opt/${pkgname}/"
    install -Dm755 data/noarch/support/*.{sh,shlib} -t  \
        "${pkgdir}/opt/${pkgname}/support"

    # Desktop integration
    install -Dm 644 "data/noarch/support/icon.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "data/noarch/docs/End User License Agreement.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 "${srcdir}/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm755 "${srcdir}/${pkgname}" \
        "${pkgdir}/usr/bin/${pkgname}"
}
