# Maintainer:  ainola <opp310@alh.rqh> (ROT13)

pkgname=outlast-gog
pkgver=1.01_2.0.0.2
_gogver=2.0.0.2
pkgrel=2
pkgdesc="Hell is an experiment you can't survive in Outlast."
arch=('i686' 'x86_64')
url="http://www.redbarrelsgames.com/"
license=('custom: commercial')
depends=('libvorbis' 'sdl2')
source=("local://gog_outlast_${_gogver}.sh"
        "${pkgname}.desktop")
sha256sums=("d8fb15a9ced75152525274aaec5c6522c80a8f6eadf221e854613d193c1705b6"
            "15884e4cf9229071fc8e1813f76f1c869c727332af2abda6410d80a829e96d3f")
# Prevent compressing final package
PKGEXT='.pkg.tar'

package() {
    mkdir -p "${pkgdir}/opt/${pkgname}/"

    # Launcher and Data
    cp -Ral "${srcdir}/data/noarch/"* "${pkgdir}/opt/${pkgname}"

    # Install Binaries/Launchers
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/game/Binaries/Linux/OLGame.${CARCH}" \
          "${pkgdir}/usr/bin/outlast"

    # Desktop Integration
    mkdir -p "${pkgdir}/usr/share/pixmaps/"
    ln -s "/opt/${pkgname}/game/OLGame/Icon.png" \
          "${pkgdir}/usr/share/pixmaps/outlast.png"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Permissions
    find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} \;
    find "${pkgdir}/opt/${pkgname}" -type f -exec chmod 644 {} \;
    chmod 755 "${pkgdir}/opt/${pkgname}/game/Binaries/Linux/OLGame.${CARCH}"
}
