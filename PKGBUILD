# Maintainer: Quint Guvernator <quint@guvernator.net>

pkgname="creddit-git"
pkgver=r214.aa129b9c9b2a
pkgrel=1
pkgdesc='CLI Reddit client written in C.'
arch=('x86_64' 'i686')
url='https://github.com/Cotix/cReddit'
license=('MIT')
depends=('ncurses' 'curl')
makedepends=('git')
provides=("$pkgname")
conflicts=("$pkgname")
source=(
    "$pkgname::git+https://github.com/Cotix/cReddit.git"
    '01-ncursesw-is-default-ncurses.patch'
)
md5sums=('SKIP'
         '9b475cc98d0319356772d8472b602c67')

prepare() {
    # patch the location of the ncursesw library
    patch -p1 -i "$srcdir/01-ncursesw-is-default-ncurses.patch"
}

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    make
}

package() {
    cd "$pkgname"
    make PREFIX="$pkgdir/usr/" install
}
