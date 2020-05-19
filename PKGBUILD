# Maintainer: Danny Bautista <aur at pyrolagus.de>
# https://github.com/Earnestly/pkgbuilds/tree/master/bemenu-git
pkgname=bemenu-git
_pkgname="bemenu"
pkgver=r373.6343a65
pkgrel=1

# Wayland without wlroots is not supported.
# https://github.com/Cloudef/bemenu/issues/79#issuecomment-572867783
pkgdesc='Dynamic menu library and client program inspired by dmenu with support for wlroots-based wayland compositors'
url='https://github.com/Cloudef/bemenu'
arch=(x86_64)
license=(GPL3 LGPL3)
provides=('bemenu')
conflicts=('bemenu')
depends=(pango)
makedepends=(cmake libxinerama libxkbcommon ncurses wayland wlroots)
optdepends=(
    'libxinerama: For the x11 backend'
    'libxkbcommon: For the wayland backend'
    'ncurses: For the curses backend'
    'wayland: For the wayland backend'
    'wlroots: For the wayland backend'
)
source=("$_pkgname::git+https://github.com/Cloudef/bemenu")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    make PREFIX="$pkgdir/usr"
}

package_bemenu-git() {
    cd "$_pkgname"
    make install PREFIX="$pkgdir/usr"
}
