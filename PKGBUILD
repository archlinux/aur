# Maintainer: Quint Guvernator <quint@guvernator.net>

_pkgname=creddit
pkgname=creddit-git
pkgver=r214.aa129b9c9b2a
pkgrel=2
pkgdesc='CLI Reddit client written in C.'
arch=('x86_64' 'i686')
url='https://github.com/Cotix/cReddit'
license=('MIT')
depends=('ncurses' 'curl')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
    "$_pkgname::git+https://github.com/Cotix/cReddit.git"
    '01-ncursesw-is-default-ncurses.patch'
)
md5sums=('SKIP'
         'f61218a4235e342f7b094d8aac189683')

prepare() {
    cd "$_pkgname"

    # patch the location of the ncursesw library
    patch -p1 -i "$srcdir/01-ncursesw-is-default-ncurses.patch"
}

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    make
}

package() {
    cd "$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    make PREFIX="$pkgdir/usr/" install
}
