# Maintainer: MCMic <come@chilliet.eu>

pkgname=roguelegacy-hib
_pkgname=roguelegacy
pkgver=12282013
pkgrel=1
pkgdesc="A genealogical \"roguelite\" where anyone can be a hero"
url="http://www.cellardoorgames.com/roguelegacy"
license=('custom')
arch=('i686' 'x86_64')
_gamepkg="${_pkgname}-${pkgver}-bin"
source=("hib://${_gamepkg}")
sha256sums=('ad1803cf6ce93cb971de5511865297228c7ad657f1f15040ded544148e7f3e3e')
makedepends=('gendesk' 'imagemagick')
_name='Rogue Legacy'
_genericname='Rogue Legacy'
_categories='Game;ArcadeGame'

prepare() {
  gendesk --pkgname "${_pkgname}" -n -f ../PKGBUILD
}

package()
{
    cd "$srcdir"

    # Install game
    install -d "${pkgdir}/opt/"
    install -d "${pkgdir}/usr/bin/"
    install -d "${pkgdir}/usr/share/pixmaps/"

    cp -r "data" "${pkgdir}/opt/${_pkgname}"
    # using straight cp on the supplied tarball tends to have screwy permissions
    find "${pkgdir}/opt/${_pkgname}" -type d -exec chmod 755 {} \;

    # Desktop integration
    echo -e "#!/bin/sh\ncd /opt/${_pkgname}\n./RogueLegacy" > ${pkgdir}/usr/bin/${_pkgname}
    chmod +x ${pkgdir}/usr/bin/${_pkgname}
    convert "data/Rogue Legacy.bmp" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
