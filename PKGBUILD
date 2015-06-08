# Maintainer:  ainola <opp310@alh.rqh> (ROT13)

pkgname=battle-cube
pkgver=1
pkgrel=2
pkgdesc="A Unity experiment by Nifflas"
arch=('i686' 'x86_64')
url="http://nifflas.ni2.se/?page=Miscellaneous"
license=('custom')
depends=('glu' 'libxcursor' 'libxext')
source=(battle-cube.zip::"http://nifflas.ni2.se/content/Misc/Battle%20Cube%20Linux.zip"
        "${pkgname}.desktop")
sha256sums=("d15a537076565561edd0370d808ba55c90008d48242a79639a0c8c886518faf5"
            "67a7dedbafdf68d658974484bdcdbdfdcbce453815cf2420ceefec8195d58058")
[ "$CARCH" == "x86_64" ] && _arch="x86_64" || _arch="x86"

package() {
    # Launcher and Data
    install -Dm755 "${srcdir}/Battle Cube.${_arch}" "${pkgdir}/opt/${pkgname}/Battle Cube.${_arch}"
    mv "${srcdir}/Battle Cube_Data" "${pkgdir}/opt/${pkgname}/"

    # Install Binaries/Launchers
    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/${pkgname}/Battle Cube.${_arch}"  "${pkgdir}/usr/bin/${pkgname}"

    # Desktop Integration
    mkdir -p "$pkgdir/usr/share/pixmaps"
    ln -s "/opt/${pkgname}/Battle Cube_Data/Resources/UnityPlayer.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Fix wonky permissions
    find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} \;
    find "${pkgdir}/opt/${pkgname}" -type f -exec chmod 644 {} \;
    chmod 755 "${pkgdir}/opt/${pkgname}/Battle Cube.${_arch}"
}
