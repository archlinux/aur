# Maintainer:  ainola <opp310@alh.rqh> (ROT13)

pkgname=7-light-years
pkgver=1
pkgrel=2
pkgdesc="7 Light-Years is a game of flying down an endless corridor of neon wire-meshes and geometrical shapes."
arch=('i686' 'x86_64')
url="http://nifflas.ni2.se/?page=Miscellaneous"
license=('custom')
depends=('glu')
source=(7-light-years.zip::"http://nifflas.ni2.se/content/Misc/7%20Light-years%20Linux.zip"
        "${pkgname}.desktop")
sha256sums=("2ff18a59d5741e17ce5fad001137e7a75babda0be5138539da0c87b3a8f3ebf9"
            "898af2f7eec0f537e609d67cf2c197b87ac7f43438f7d3d881adfadbee105225")
[ "$CARCH" == "x86_64" ] && _arch="x86_64" || _arch="x86"


package() {
    # Launcher and Data
    install -Dm755 "${srcdir}/7 Light-years.${_arch}" "${pkgdir}/opt/${pkgname}/7 Light-years.${_arch}"
    mv "${srcdir}/7 Light-years_Data" "${pkgdir}/opt/${pkgname}/"

    # Install Binaries/Launchers
    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/${pkgname}/7 Light-years.${_arch}"  "${pkgdir}/usr/bin/${pkgname}"

    # Desktop Integration
    mkdir -p "$pkgdir/usr/share/pixmaps"
    ln -s "/opt/${pkgname}/7 Light-years_Data/Resources/UnityPlayer.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Fix wonky permissions
    find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} \;
    find "${pkgdir}/opt/${pkgname}" -type f -exec chmod 644 {} \;
    chmod 755 "${pkgdir}/opt/${pkgname}/7 Light-years.${_arch}"
}
