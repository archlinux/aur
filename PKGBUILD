# Maintainer: Piotr Rogoza <piotr dot r dot public at gmail dot com>
# Contributor: Max Roder <maxroder@web.de>

# To port this PKGBUILD to another language of tor-browser you
# have to change $pkgname, $_language, $pkgdesc and $url in PKGBUILD
# AND (!) the first line in the .install file!

pkgname=tor-browser-pl
pkgver=4.5.1
pkgrel=1
_language=pl
pkgdesc='Tor Browser Bundle: Anonymous browsing using firefox and tor'
url='https://www.torproject.org/projects/torbrowser.html.en'
arch=('x86_64' 'i686')
license=('GPL')
depends=(bash)
optdepends=(
'zenity: simple dialog boxes'
'kdebase-kdialog: KDE dialog boxes'
'libnotify: Gnome dialog boxes'
)
install="${pkgname}.install"
if [ "$CARCH" == x86_64 ]; then
  _pkgarch=64
elif [ "$CARCH" == "i686" ]; then
  _pkgarch=32
fi
source_x86_64=(
"https://torproject.org/dist/torbrowser/$pkgver/tor-browser-linux64-${pkgver}_${_language}.tar.xz"
"https://torproject.org/dist/torbrowser/$pkgver/tor-browser-linux64-${pkgver}_${_language}.tar.xz.asc"
"${pkgname}.desktop"
"${pkgname}.png"
"${pkgname}.sh"
)
sha256sums_x86_64=('cf129f3b140a85487da5a791dbde1d21b6b3d309d2e3f5c2577100863b117089'
                   'SKIP'
                   '3d5fc01f2cfbae0a00b7117b0b0a24028d1686e6f81a347809f74de2d8522ff7'
                   '17fc2f5784d080233aca16e788d62ab6fe3e57cf781b123cfe32767de97d6d3b'
                   'f25fedfa77b19a96488529e6d387411fb49a82e99e3a1a9708b88ad8b6e7d2aa')
sha256sums_i686=('a6071a76a613a4955139ddd28d790f8d5d645ce17dde802d1a4ac9fb5465ac1c'
                 'SKIP'
                 '3d5fc01f2cfbae0a00b7117b0b0a24028d1686e6f81a347809f74de2d8522ff7'
                 '17fc2f5784d080233aca16e788d62ab6fe3e57cf781b123cfe32767de97d6d3b'
                 'f25fedfa77b19a96488529e6d387411fb49a82e99e3a1a9708b88ad8b6e7d2aa')
source_i686=(
"https://torproject.org/dist/torbrowser/$pkgver/tor-browser-linux32-${pkgver}_${_language}.tar.xz"
"https://torproject.org/dist/torbrowser/$pkgver/tor-browser-linux32-${pkgver}_${_language}.tar.xz.asc"
"${pkgname}.desktop"
"${pkgname}.png"
"${pkgname}.sh"
)
# validpgpkeys=(8738A680B84B3031A630F2DB416F061063FEE659) # Erinn Clark
validpgpkeys=(EF6E286DDA85EA2A4BA7DE684E2C6E8793298290) # Tor Browser Developers
noextract=("tor-browser-linux${_pkgarch}-${pkgver}_${_language}.tar.xz")
package() {
    cd "$srcdir"

    sed -i "s/REPL_NAME/${pkgname}/g"       ${pkgname}.sh
    sed -i "s/REPL_VERSION/${pkgver}/g"     ${pkgname}.sh
    sed -i "s/REPL_LANGUAGE/${_language}/g" ${pkgname}.sh

    sed -i "s/REPL_NAME/${pkgname}/g"       ${pkgname}.desktop
    sed -i "s/REPL_LANGUAGE/${_language}/g" ${pkgname}.desktop
    sed -i "s/REPL_COMMENT/${pkgdesc}/g"    ${pkgname}.desktop

    install -Dm 644 ${pkgname}.desktop      ${pkgdir}/usr/share/applications/${pkgname}.desktop
    install -Dm 644 ${pkgname}.png          ${pkgdir}/usr/share/pixmaps/${pkgname}.png
    install -Dm 755 ${pkgname}.sh           ${pkgdir}/usr/bin/${pkgname}

    install -Dm 644 tor-browser-linux${_pkgarch}-${pkgver}_${_language}.tar.xz ${pkgdir}/opt/${pkgname}/tor-browser-linux${_pkgarch}-${pkgver}_${_language}.tar.xz
}
