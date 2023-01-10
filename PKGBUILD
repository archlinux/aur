# Maintainer: bbaovanc <bbaovanc@bbaovanc.com>

_pkgname=smines
pkgname=$_pkgname-git
pkgver=r136.4251ea7
pkgrel=2
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
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$_pkgname/LICENSE"
    install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" "$_pkgname/README.md"
}
