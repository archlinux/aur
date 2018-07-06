# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>

pkgname=lookbook-git
_gitname=lookbook
pkgver=r320.3dca829
pkgrel=1
pkgdesc="Browse and find system icons."
arch=('i686' 'x86_64')
url="https://github.com/danrabbit/lookbook"
license=('GPL3')
depends=('gtk3' 'vala' 'granite' 'gtksourceview3')
optdepends=()
makedepends=('git' 'meson' 'ninja')
provides=("$_pkgname")
conflicts=("$_gitname")
source=("git+https://github.com/danrabbit/lookbook.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_gitname}/"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_gitname}/"
    meson . _build --prefix=/usr
    ninja -C _build
}

package() {
    cd "${srcdir}/${_gitname}/"
    DESTDIR="${pkgdir}" ninja -C _build install
}

