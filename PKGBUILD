# Maintainer: kyndair <kyndair at gmail dot com>
# Place the gog installation file in the same folder as this PKGBUILD
pkgname=gog-tangledeep-legend-of-shara
_dlcparent=tangledeep
_pkgname=tangledeep_legend_of_shara
pkgver=1.36b
_pkgver=1_36b
_build=43839
_goggame=1971722134
pkgrel=1
pkgdesc="DLC for the ${_dlcparent} game."
arch=('i686' 'pentium4' 'x86_64')
url="https://www.gog.com/game/${_pkgname}s"
license=('custom')
depends=("${_dlcparent}")
confilcts=("humble-tangledeep-legend-of-shara")
makedepends=('p7zip')
source=("${_pkgname}_${_pkgver}_${_build}.sh::gog://${_pkgname}_${_pkgver}_${_build}.sh")
# don't download anything via makepkg
DLAGENTS+=("gog::/usr/bin/perl -E print\(\"${RED}\"\ .\ substr\(\"%u\",\ 6\)\ .\ \"\ not\ found.\ \ Check\ the\ PKGBUILD\ for\ further\ information.${ALL_OFF}\\\\n\"\)\;\ exit\ 1")
sha256sums=('ca52ba0ff305b4ac06e44af6b9de752b37f9fe413ebf41a975367effa1d68817')
noextract=("${_pkgname}_${_pkgver}_${_build}.sh")

prepare() {
    7z x -tzip -y ${_pkgname}_${_pkgver}_${_build}.sh
}

package() {
    # install goggame files
    install -Dm644 "${srcdir}/data/noarch/game/goggame-${_goggame}.hashdb" "${pkgdir}/opt/${_dlcparent}/goggame-${_goggame}.hashdb"
    install -Dm644 "${srcdir}/data/noarch/game/goggame-${_goggame}.info" "${pkgdir}/opt/${_dlcparent}/goggame-${_goggame}.info"
    # install DLC key. Assets are now pre-installed in the main game
    install -Dm644 "${srcdir}/data/noarch/game/Tangledeep_Data/dlc/loschk" "${pkgdir}/opt/${_dlcparent}/Tangledeep_Data/dlc/loschk"
}
