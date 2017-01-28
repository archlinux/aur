# Maintainer: Krakn - Dan.Ray.Beste@gmail.com
# Thanks to: Ainola for the base PKGBUILD (gog-undertale)

# All dependencies are included with the gog_owlboy_$version.sh file.
# For good measure I was able to track all but 2 down:
#   libmojoshader - https://icculus.
#   libXNAFileDialog - https://github.com/flibitijibibo/XNAFileDialog

pkgname=gog-owlboy
pkgver=2.0.0.1
pkgrel=1
pkgdesc="Owlboy is a 'hi-bit' adventure game, where you can fly and explore a brand new world in the clouds!"
url="http://www.owlboygame.com/"
license=(
    'custom'
)
arch=(
    'i686'
    'x86_64'
)
depends_x86_64=(
    'libogg'
    'libvorbis'
    'openal'
    'sdl2'
)
depends_i686=(
    'lib32-libogg'
    'lib32-libvorbis'
    'lib32-openal'
    'lib32-sdl2'
)
optdepends=(
    'firejail: Automatically sandbox this application from your OS'
)
source=(
    "gog://${pkgname//-/_}_${pkgver}.sh"
    "${pkgname}.desktop"
    "${pkgname}"
)
sha256sums=(
    '76958e0bb434d2514873aaddb892bc6c7055c39799ecde5f62a56345136853fc'
    '8574e2463800004ddf97e49d2760d834413bf51fda4b1a57ead8cc10b07ac4f2'
    '160b4d0fb275d3c1d4d6d574ca4085579e944e67dd32bd0a0c6e79f2e3d105a6'
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
    install -Dm755 "data/noarch/start.sh"               \
        "${pkgdir}/opt/${pkgname}/"
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
