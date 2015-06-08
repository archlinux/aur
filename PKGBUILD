# Maintainer:  ainola <opp310@alh.rqh> (ROT13)

pkgname=ynglet
pkgver=1
pkgrel=2
pkgdesc="Ynglet is a game about swimming inside cubes that are floating around in the air."
arch=('i686' 'x86_64')
url="http://nifflas.ni2.se/?page=Miscellaneous"
license=('custom')
depends=('glu')
source=(ynglet.zip::"http://nifflas.ni2.se/content/Misc/Ynglet%20Linux.zip"
        "${pkgname}.desktop")
sha256sums=("95d057275bc6f001b63c9a4cdcc0d43d32f8483a2114d202cdcb801759fb7174"
            "550bc6fda12814d6faef658f4df339d3208c2a6be440400471e10e2fb679e684")
[ "$CARCH" == "x86_64" ] && _arch="x86_64" || _arch="x86"

package() {
    # Launcher and Data
    install -Dm755 "${srcdir}/Ynglet.${_arch}" "${pkgdir}/opt/${pkgname}/Ynglet.${_arch}"
    mv "${srcdir}/Ynglet_Data" "${pkgdir}/opt/${pkgname}/"

    # Install Binaries/Launchers
    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/${pkgname}/Ynglet.${_arch}"  "${pkgdir}/usr/bin/${pkgname}"

    # Desktop Integration
    mkdir -p "$pkgdir/usr/share/pixmaps"
    ln -s "/opt/${pkgname}/Ynglet_Data/Resources/UnityPlayer.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Fix wonky permissions
    find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} \;
    find "${pkgdir}/opt/${pkgname}" -type f -exec chmod 644 {} \;
    chmod 755 "${pkgdir}/opt/${pkgname}/Ynglet.${_arch}"
}
