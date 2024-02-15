# Maintainer: Douglas Creager <dcreager@dcreager.net>
pkgname=nereusx-notes-git
epoch=2
pkgver=r6.2947cc5
pkgrel=1
pkgdesc="Plain-text notes manager, CLI and TUI"
arch=("x86_64")
url="https://codeberg.org/nereusx/notes"
license=('GPL-3.0')
depends=('ncurses')
makedepends=('git' 'gzip' 'md2roff')
provides=('nereusx-notes')
conflicts=('nereusx-notes')
source=("${pkgname}::git+https://codeberg.org/nereusx/notes.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    make DESTDIR="$pkgdir" prefix=/usr install
}
