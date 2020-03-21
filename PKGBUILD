# Maintainer: Falk Alexander Seidl <fa@terminal.run>

pkgname=setzer-git
_gitname=Setzer
pkgver=r314.9faed55
pkgrel=1
pkgdesc="LaTeX editor written in Python with Gtk"
arch=('i686' 'x86_64')
url="https://github.com/cvfosammmm/Setzer"
license=('GPL3')
depends=('gtk3' 'gtksourceview3' 'poppler-glib' 'texlive-core' 'gspell')
makedepends=('git' 'meson')
source=("git+https://github.com/cvfosammmm/Setzer")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_gitname}/"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_gitname}/"
	arch-meson . _build --prefix=/usr
	ninja -C _build
}

package() {
    cd "${srcdir}/${_gitname}/"
    DESTDIR="${pkgdir}" ninja -C _build install
}
