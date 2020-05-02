# Maintainer: ftsell <aur@finn-thorben.me>
pkgname=gnome-shell-extension-pop-shell-git
pkgdesc="Pop Shell - Tiling window management in Gnome (WIP)"
pkgver=r192.e15786b
pkgrel=1
_gitorg=pop-os
_gitname=shell
_gitbranch=master_focal
arch=(any)
url="https://github.com/pop-os/shell"
license=("GPLv3")

conflicts=("gnome-shell-extension-pop-shell")
makedepends=("typescript")
depends=("gnome-shell" "pop-shell-shortcuts-git")


_dir="${_gitname}"
source=("${_dir}::git+https://github.com/${_gitorg}/${_gitname}.git#branch=${_gitbranch}")
sha256sums=("SKIP")


pkgver() {
    cd "${srcdir}/${_dir}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
    cd "${srcdir}/${_dir}"
    make all
}


package() {
    cd "${srcdir}/${_dir}"
    make DESTDIR="${pkgdir}/" install
}

