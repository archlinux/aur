# Maintainer: DrRac27 <drrac27 at riseup dot net>

pkgname=freecad-a2plus-git
pkgver=v0.4.55.r2.eda4fc3
pkgrel=1
pkgdesc="Assembly workbench for FreeCAD"
arch=('any')
license=('LGPL')
depends=('freecad>=0.16')
conflicts=('freecad-a2plus')

_gitname='A2plus'
url="https://github.com/kbwbe/${_gitname}"
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    # Hack: skip v0.23 as it is not the latest tag (inconsistent naming)
    local tag=$(git tag --sort=-v:refname | grep -v v0.23 | head -1)
    local commits_since=$(git rev-list $tag..HEAD --count)
    echo "$tag.r$commits_since.$(git log --pretty=format:'%h' -n 1)"

}

build() {
    :
}

package() {
    cd "${pkgname}"
    install -d  "${pkgdir}/usr/lib/freecad/Mod/${_gitname}"
    cp -R ./*   "${pkgdir}/usr/lib/freecad/Mod/${_gitname}"
}
