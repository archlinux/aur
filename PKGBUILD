# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>

pkgname=quilter-git
_gitname=quilter
pkgver=r320.3dca829
pkgrel=1
pkgdesc="Markdown reader with preview option. Donations: Would you like to support the development of this app to new heights? Then: https://www.patreon.com/lainsce"
arch=('i686' 'x86_64')
url="https://github.com/lainsce/quilter"
license=('GPL3')
depends=('gtk3' 'vala' 'granite' 'gtkspell3' 'gtksourceview3' 'webkit2gtk' 'discount')
optdepends=()
makedepends=('git' 'meson' 'ninja')
provides=("$_pkgname")
conflicts=("$_gitname")
source=("git+https://github.com/lainsce/quilter.git")
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

