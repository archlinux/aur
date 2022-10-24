# Maintainer: kyndair <kyndair at gmail dot com>
# Place the gog installation file in the same folder as this PKGBUILD
pkgname=humble-tangledeep
_pkgname=tangledeep
pkgver=1.53a
pkgrel=1
pkgdesc="Trapped in underground villages with no memory of the world at the surface, you must survive an ever-changing labyrinth to discover what lies above."
arch=('x86_64')
url="https://www.humblebundle.com/store/${_pkgname}"
license=('custom')
provides=('tangledeep')
conflicts=('gog-tangledeep')
source=("Tangledeep_153a_LinuxUniversal.zip::humble://Tangledeep_153a_LinuxUniversal.zip"
        "${_pkgname}.desktop")
# don't download anything via makepkg
DLAGENTS+=("humble::/usr/bin/perl -E print\(\"${RED}\"\ .\ substr\(\"%u\",\ 6\)\ .\ \"\ not\ found.\ \ Check\ the\ PKGBUILD\ for\ further\ information.${ALL_OFF}\\\\n\"\)\;\ exit\ 1")
sha256sums=('482bb9e9b654a4d46caa3c960ef4e08ada5ca6f51290e852617230c1aeb1b019'
            'a5d0ecd7d72687445a91822f06b15194c728be37a18df85343340a864ac112c0')
noextract=("${_pkgname}.desktop")

package() {
    # install launcher
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    # install game icon
    install -Dm644 "${srcdir}/linuxuniversal/Tangledeep_Data/Resources/UnityPlayer.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
    # set the correct permissions and move the game data into pkg
    mkdir "${pkgdir}/opt"
    mkdir "${pkgdir}/opt/${_pkgname}"
    find "${srcdir}/linuxuniversal/Tangledeep_Data" -type d -exec chmod 755 {} +
    find "${srcdir}/linuxuniversal/Tangledeep_Data" -type f -exec chmod 644 {} +
    mv "${srcdir}/linuxuniversal/Tangledeep_Data" "${pkgdir}/opt/${_pkgname}"
    # install correct executable
    install -Dm755 "${srcdir}/linuxuniversal/Tangledeep.x86_64" "${pkgdir}/opt/${_pkgname}/Tangledeep"
    # link executable in /usr/bin
    mkdir "${pkgdir}/usr/bin"
    ln -s /opt/${_pkgname}/Tangledeep "${pkgdir}/usr/bin/Tangledeep"
}
