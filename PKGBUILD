# Maintainer: kyndair <kyndair at gmail dot com>
# Place the gog installation file in the same folder as this PKGBUILD
pkgname=gog-pillars_of_eternity_white_march_dlc
_dlcparent=pillars_of_eternity
_pkgname=pillars_of_eternity_white_march
pkgver=3.07.0.1318
_pkgver=3_07_0_1318
_build=17464
pkgrel=1
pkgdesc="DLC for the $(echo ${_dlcparent} | sed 's/_/ /g') game."
arch=('x86_64')
url="https://www.gog.com/en/game/pillars_of_eternity_the_white_march_expansion_pass"
license=('custom')
depends=($(echo gog-${_dlcparent}))
source=("${_pkgname}_part_1_dlc_en_${_pkgver}_${_build}.sh::gog://${_pkgname}_part_1_dlc_en_${_pkgver}_${_build}.sh"
        "${_pkgname}_part_2_dlc_en_${_pkgver}_${_build}.sh::gog://${_pkgname}_part_2_dlc_en_${_pkgver}_${_build}.sh")
# don't download anything via makepkg
DLAGENTS+=("gog::/usr/bin/perl -E print\(\"${RED}\"\ .\ substr\(\"%u\",\ 6\)\ .\ \"\ not\ found.\ \ Check\ the\ PKGBUILD\ for\ further\ information.${ALL_OFF}\\\\n\"\)\;\ exit\ 1")
sha256sums=('86fd6f1a6fc77891c76b5207152d22a0951c3d57e9a8730b13c3c54d80e824b9'
            'c5445c983d6000aa0b5457d10939657c0fd24f7f1bc2de5acd9572fe986e2706')

package() {
    # install goggame files
    find "${srcdir}/data/noarch/game/PillarsOfEternity_Data" -type d -exec chmod 755 {} +
    find "${srcdir}/data/noarch/game/PillarsOfEternity_Data" -type f -exec chmod 644 {} +
    mkdir -p "${pkgdir}/opt/${_dlcparent}"
    mv "${srcdir}/data/noarch/game/PillarsOfEternity_Data" "${pkgdir}/opt/${_dlcparent}"
}
