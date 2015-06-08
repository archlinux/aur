# Maintainer:  ainola <opp310@alh.rqh> (ROT13)

pkgname=7-nanocycles
pkgver=1
pkgrel=2
pkgdesc="7 Nanocycles is a game of flying down an endless corridor of neon wire-meshes and geometrical shapes."
arch=('i686' 'x86_64')
url="http://nifflas.ni2.se/?page=Miscellaneous"
license=('custom')
depends=('glu')
source=(7-nanocycles.zip::"http://nifflas.ni2.se/content/Misc/7%20Nanocycles%20Linux.zip"
        "${pkgname}.desktop")
sha256sums=("2f159763c891ed68b572fe322f222121559769d37d3edf8c8a4e3034ecdbda93"
            "bb2162b3a78bc95285ae81f67570a2210c84e186fbe8eff8431ad539ebb4a843")
[ "$CARCH" == "x86_64" ] && _arch="x86_64" || _arch="x86"

package() {
    # Launcher and Data
    install -Dm755 "${srcdir}/7 Nanocycles.${_arch}" "${pkgdir}/opt/${pkgname}/7 Nanocycles.${_arch}"
    mv "${srcdir}/7 Nanocycles_Data" "${pkgdir}/opt/${pkgname}/"

    # Install Binaries/Launchers
    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/${pkgname}/7 Nanocycles.${_arch}"  "${pkgdir}/usr/bin/${pkgname}"

    # Desktop Integration
    mkdir -p "$pkgdir/usr/share/pixmaps"
    ln -s "/opt/${pkgname}/7 Nanocycles_Data/Resources/UnityPlayer.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Fix wonky permissions
    find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} \;
    find "${pkgdir}/opt/${pkgname}" -type f -exec chmod 644 {} \;
    chmod 755 "${pkgdir}/opt/${pkgname}/7 Nanocycles.${_arch}"
}
