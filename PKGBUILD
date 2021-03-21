# Maintainer: kyndair <kyndair at gmail dot com>
# Place the gog installation file in the same folder as this PKGBUILD
pkgname=gog-darkest-dungeon-the-color-of-madness
_dlcparent=darkest_dungeon
_pkgname=darkest_dungeon_the_color_of_madness
pkgver=24839
_pkgver=24839
_build=28859
pkgrel=1
pkgdesc="DLC for the $(echo ${_dlcparent} | sed 's/_/ /g') game."
arch=('any')
url="https://www.gog.com/game/${_pkgname}"
license=('custom')
depends=($(echo gog-${_dlcparent} | sed 's/_/-/g'))
makedepends=('p7zip')
source=("${_pkgname}_${_pkgver}_${_build}.sh::gog://${_pkgname}_${_pkgver}_${_build}.sh")
# don't download anything via makepkg
DLAGENTS+=("gog::/usr/bin/perl -E print\(\"${RED}\"\ .\ substr\(\"%u\",\ 6\)\ .\ \"\ not\ found.\ \ Check\ the\ PKGBUILD\ for\ further\ information.${ALL_OFF}\\\\n\"\)\;\ exit\ 1")
sha256sums=('6c53aa6d0f348f43015e674d707a9cf07297214c23eb27c8d26506751ec9ea97')
noextract=("${_pkgname}_${_pkgver}_${_build}.sh")

prepare() {
    7z x -tzip -y ${_pkgname}_${_pkgver}_${_build}.sh
}

package() {
    # install DLC.
    find "${srcdir}/data/noarch/game" -type d -exec chmod 755 {} +
    find "${srcdir}/data/noarch/game" -type f -exec chmod 644 {} +
    mkdir -p "${pkgdir}/opt/${_dlcparent}"
    mv "${srcdir}/data/noarch/game/"* "${pkgdir}/opt/${_dlcparent}"
}
