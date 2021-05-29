# Maintainer: bbaovanc <bbaovanc@bbaovanc.com>

_pkgname=smines
pkgname=$_pkgname-git
pkgver=r133.38f66f7
pkgrel=1
pkgdesc="Minesweeper for the terminal, using C and ncurses."
arch=(any)
url="https://github.com/BBaoVanC/$_pkgname"
license=('GPL3')
makedepends=('git' 'ncurses')
provides=("$_pkgname")
conflicts=("$_pkgname")

source=("git+$url.git")
sha256sums=('SKIP')

_makeopts="--directory=$_pkgname"

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    make $_makeopts
}

package() {
    local installopts='--mode 0644 -D --target-directory'
    local shrdir="$pkgdir/usr/share"
    local licdir="$shrdir/licenses/$pkgname"
    local docdir="$shrdir/doc/$pkgname"
    make $_makeopts PREFIX=/usr DESTDIR="$pkgdir" install
    install $installopts "$licdir" "$_pkgname/LICENSE"
    install $installopts "$docdir" "$_pkgname/README.md"
}
