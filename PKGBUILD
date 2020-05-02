# Maintainer: ftsell <aur@finn-thorben.me>
pkgname=pop-shell-shortcuts-git
pkgdesc="Application for displaying and demoing Pop Shell shortcuts "
pkgver=r25.ada2c50
pkgrel=1
_gitorg=pop-os
_gitname=shell-shortcuts
_gitbranch=master_focal
arch=(any)
url="https://github.com/pop-os/shell-shortcuts"
license=("GPLv3")

conflicts=("pop-shell-shortcuts")
makedepends=("rust")
depends=("cairo" "glib" "pango" "atk" "gdk-pixbuf2" "gtk3")


_dir="${_gitname}"
source=("${_dir}::git+https://github.com/${_gitorg}/${_gitname}.git#branch=${_gitbranch}")
sha256sums=("SKIP")


pkgver() {
    cd "${srcdir}/${_dir}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
    cd "${srcdir}/${_dir}"
    make update
    make all
}


package() {
    cd "${srcdir}/${_dir}"
    make DESTDIR="${pkgdir}/" install
}

