# Maintainer: kyndair <kyndair at gmail dot com>
# Place the gog installation file in the same folder as this PKGBUILD
pkgname=gog-pathfinder_kingmaker_the_wildcards_dlc
_dlcparent=pathfinder_kingmaker
_pkgname=pathfinder_kingmaker_the_wildcards
_goggame=2026597518
pkgver=2.1.5d
_pkgver=2_1_5d
_build=41987
pkgrel=1
pkgdesc="DLC for the $(echo ${_dlcparent} | sed 's/_/ /g') game."
arch=('x86_64')
url="https://www.gog.com/en/game/pathfinder_kingmaker_the_wildcards"
license=('custom')
depends=($(echo gog-${_dlcparent}))
source=("${_pkgname}_${_pkgver}_${_build}.sh::gog://${_pkgname}_${_pkgver}_${_build}.sh")
# don't download anything via makepkg
DLAGENTS+=("gog::/usr/bin/perl -E print\(\"${RED}\"\ .\ substr\(\"%u\",\ 6\)\ .\ \"\ not\ found.\ \ Check\ the\ PKGBUILD\ for\ further\ information.${ALL_OFF}\\\\n\"\)\;\ exit\ 1")
sha256sums=('43e64f35ddaafa4e4e4fe805f135504939a7347d52c3e1dbaf0f3b4caa6ce698')
noextract=("${_pkgname}_${_pkgver}_${_build}.sh")

prepare() {
    gogextract ${_pkgname}_${_pkgver}_${_build}.sh
    bsdtar -xf data.zip
}

package() {
    # install game documents
    find "${srcdir}/data/noarch/docs" -type d -exec chmod 755 {} +
    find "${srcdir}/data/noarch/docs" -type f -exec chmod 644 {} +
    mkdir -p "${pkgdir}/usr/share/doc/${_pkgname}"
    mv "${srcdir}/data/noarch/docs/"*/* "${pkgdir}/usr/share/doc/${_pkgname}"
    # install game files
    install -Dm644 "${srcdir}/data/noarch/game/goggame-${_goggame}.hashdb" "${pkgdir}/opt/${_dlcparent}/goggame-${_goggame}.hashdb"
    install -Dm644 "${srcdir}/data/noarch/game/goggame-${_goggame}.info" "${pkgdir}/opt/${_dlcparent}/goggame-${_goggame}.info"
}
