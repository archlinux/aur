# Maintainer: Fazzi <faaris<dot>ansari<at>proton<dot>me>
pkgname=waywall-git
_gitname=waywall
pkgver=r685.2024.10.04
pkgrel=1
pkgdesc="Wayland compositor for Minecraft speedrunning "
arch=('any')
url="https://github.com/tesselslate/waywall"
license=('GPL3')
makedepends=(git wayland-protocols)
depends=(libxkbcommon luajit wayland)
source=("git+https://github.com/tesselslate/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
    cd ${_gitname}
    printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git log -1 --date=short --pretty=format:%cd | sed 's/-/./g')"
}

build() {
    cd "${srcdir}/${_gitname}"
    make
}

package() {
    cd "${srcdir}/${_gitname}/build/waywall"
    install -Dm755 waywall "$pkgdir/usr/bin/waywall"
}
