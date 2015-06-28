# Maintainer: Michele Mocciola <mickele>

pkgname=freecad-assembly2
pkgver=0.r66.g7935cb5
pkgrel=1
pkgdesc="Drawing dimensioning workbench for FreeCAD"
arch=('any')
url="https://github.com/hamish2014/FreeCAD_drawing_dimensioning"
license=('GPL3')
depends=('freecad>=0.15')
_gitname=FreeCAD_assembly2
source=("git://github.com/hamish2014/${_gitname}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}"/${_gitname}

    if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
        echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
    else
        echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
    fi
}

prepare() {
    cd "${srcdir}"/${_gitname}
}

build() {
    cd "${srcdir}"/${_gitname}
}

package() {
    cd "${pkgdir}"
    install -d "${pkgdir}"/usr/share/freecad/Mod/${_gitname}
    mv -f "${srcdir}"/${_gitname}/* "${pkgdir}"/usr/share/freecad/Mod/${_gitname}
}
