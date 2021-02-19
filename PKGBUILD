# Maintainer: kyndair <kyndair at gmail dot com>
# Place the gog installation file in the same folder as this PKGBUILD
pkgname=gog-battletech-urban-warfare
_pkgname=battletech_urban_warfare
pkgver=1.9.1.686r
_pkgver=1_9_1_686r
_build=36568
_goggame=1314028793
pkgrel=1
pkgdesc="DLC for the Battletech game."
arch=('x86_64')
url="https://www.gog.com/game/battletech_game"
license=('custom')
depends=('gog-battletech')
makedepends=('p7zip')
source=("${_pkgname}_${_pkgver}_${_build}.sh::gog://${_pkgname}_${_pkgver}_${_build}.sh")
# don't download anything automatically
DLAGENTS+=("gog::/usr/bin/perl -E print\(\"${RED}\"\ .\ substr\(\"%u\",\ 6\)\ .\ \"\ not\ found.\ \ Check\ the\ PKGBUILD\ for\ further\ information.${ALL_OFF}\\\\n\"\)\;\ exit\ 1")
sha256sums=('50cff0c5e93e972991364d256d17635030a48fed6301ca0df8329ce456ad9f88')
noextract=("${_pkgname}_${_pkgver}_${_build}.sh")

prepare() {
    7z x -tzip -y ${_pkgname}_${_pkgver}_${_build}.sh
}

package() {
    # install goggame files
    install -Dm644 "${srcdir}/data/noarch/game/goggame-${_goggame}.hashdb" "${pkgdir}/opt/battletech/goggame-${_goggame}.hashdb"
    install -Dm644 "${srcdir}/data/noarch/game/goggame-${_goggame}.info" "${pkgdir}/opt/battletech/goggame-${_goggame}.info"
    # install DLC key. Assets are now pre-installed in the main game
    install -Dm644 "${srcdir}/data/noarch/game/BattleTech_Data/StreamingAssets/lnx/4ca3924d-0d0d-42ad-8940-4a28ba71cc67.dlc" "${pkgdir}/opt/battletech/BattleTech_Data/StreamingAssets/lnx/4ca3924d-0d0d-42ad-8940-4a28ba71cc67.dlc"
}
