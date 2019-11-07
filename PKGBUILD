# Maintainer: Falk Alexander Seidl <fa@terminal.run>

pkgname=sequeler-git
_gitname=sequeler
pkgver=r331.66506cd
pkgrel=1
pkgdesc="SQL Client built in Vala and GTK3"
arch=('i686' 'x86_64')
url="https://github.com/Alecaddd/sequeler"
license=('GPL3')
depends=('gtk3' 'granite' 'libxml2' 'libgda' 'libgda-mysql' 'libgda-postgres' 'gtksourceview3')
makedepends=('git' 'meson' 'ninja' 'vala')
provides=("$_gitname")
conflicts=("$_gitname")
source=("git+https://github.com/Alecaddd/sequeler.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_gitname}/"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_gitname}/"
    arch-meson . _build
    ninja -C _build
}

package() {
    cd "${srcdir}/${_gitname}/"
    DESTDIR="${pkgdir}" ninja -C _build install
}
