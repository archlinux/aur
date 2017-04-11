# Maintainer: Dan Beste <dan.ray.beste@gmail.com>
# Thanks to: Ainola for the base PKGBUILD (gog-undertale)

pkgname=gog-yooka-laylee-toybox
pkgver=2.1.0.2
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
    '3825f83b9fc43466e84b052b4e087498d8ce3103d0fca08c6d9e56131de05c84'
    '8574e2463800004ddf97e49d2760d834413bf51fda4b1a57ead8cc10b07ac4f2'
    'c38bcc24125f6fa9b9406ee7b8cc536a0c238ab36a1cf34a8e5478dac897e80e'
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
