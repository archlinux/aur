# Maintainer: kyndair <kyndair at gmail dot com>
# Place the gog installation file in the same folder as this PKGBUILD
pkgname=gog-battletech-flashpoint
_pkgname=battletech_flashpoint
pkgver=1.9.1.686r
_pkgver=1_9_1_686r
_build=36568
_goggame=1895718372
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
sha256sums=('bd7d890a3b23417c1f19ab9a255c7358efbb65761b164d01861a459a103b94ef')
noextract=("${_pkgname}_${_pkgver}_${_build}.sh")

prepare() {
    7z x -tzip -y ${_pkgname}_${_pkgver}_${_build}.sh
}

package() {
    # install goggame files
    install -Dm644 "${srcdir}/data/noarch/game/goggame-${_goggame}.hashdb" "${pkgdir}/opt/battletech/goggame-${_goggame}.hashdb"
    install -Dm644 "${srcdir}/data/noarch/game/goggame-${_goggame}.info" "${pkgdir}/opt/battletech/goggame-${_goggame}.info"
    # install DLC key. Assets are now pre-installed in the main game
    install -Dm644 "${srcdir}/data/noarch/game/BattleTech_Data/StreamingAssets/lnx/4a23f5f2-5aa4-46ab-aba5-61057c7bb868.dlc" "${pkgdir}/opt/battletech/BattleTech_Data/StreamingAssets/lnx/4a23f5f2-5aa4-46ab-aba5-61057c7bb868.dlc"
}
