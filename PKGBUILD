# Maintainer: Michele Mocciola <mickele>

pkgname=freecad-assembly2
pkgver=0.r217.g41c899e
pkgrel=1
pkgdesc="Assembly workbench for FreeCAD v0.15"
arch=('any')
url="https://github.com/hamish2014/FreeCAD_assembly2"
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
    install -d "${pkgdir}"/usr/lib/freecad/Mod/${_gitname}
    mv -f "${srcdir}"/${_gitname}/* "${pkgdir}"/usr/lib/freecad/Mod/${_gitname}
}
