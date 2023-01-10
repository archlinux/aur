# Maintainer: bbaovanc <bbaovanc@bbaovanc.com>

_pkgname=smines
pkgname=$_pkgname-git
pkgver=r136.4251ea7
pkgrel=1
pkgdesc="Minesweeper for the terminal, using C and ncurses."
arch=(any)
url="https://github.com/BBaoVanC/$_pkgname"
license=(GPL3)
depends=(ncurses)
makedepends=(git meson)
provides=("$_pkgname")
conflicts=("$_pkgname")

source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    arch-meson $_pkgname build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
    install -m 0644 -D -t "$pkgdir/usr/share/licenses/$_pkgname/" "$_pkgname/LICENSE"
    install -m 0644 -D -t "$pkgdir/usr/share/doc/$_pkgname/" "$_pkgname/README.md"
}
