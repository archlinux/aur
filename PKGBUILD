# Maintainer: kyndair <kyndair at gmail dot com>
# Place the gog installation file in the same folder as this PKGBUILD
pkgname=gog-battletech-heavy-metal
_pkgname=battletech_heavy_metal
pkgver=1.9.1.686r
_pkgver=1_9_1_686r
_build=36568
_goggame=1733220395
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
sha256sums=('9ca700f9926b3068c6ac935315deb08d6cac209e4f9a5a0791db0f25d3818153')
noextract=("${_pkgname}_${_pkgver}_${_build}.sh")

prepare() {
    7z x -tzip -y ${_pkgname}_${_pkgver}_${_build}.sh
}

package() {
    # install goggame files
    install -Dm644 "${srcdir}/data/noarch/game/goggame-${_goggame}.hashdb" "${pkgdir}/opt/battletech/goggame-${_goggame}.hashdb"
    install -Dm644 "${srcdir}/data/noarch/game/goggame-${_goggame}.info" "${pkgdir}/opt/battletech/goggame-${_goggame}.info"
    # install DLC key. Assets are now pre-installed in the main game
    install -Dm644 "${srcdir}/data/noarch/game/BattleTech_Data/StreamingAssets/lnx/80819598-055a-4d49-8e4f-e56229674e44.dlc" "${pkgdir}/opt/battletech/BattleTech_Data/StreamingAssets/lnx/80819598-055a-4d49-8e4f-e56229674e44.dlc"
}
