# Maintainer: wins1ey <wins1ey at wins1ey dot win>
# Maintainer: EXtremeExploit <pedro.montes.alcalde at gmail dot com>
# Maintainer: Loomeh <loomeh at proton dot me>
pkgname=libresplit-git
_pkgname=libresplit
pkgver=r477.51f97f7e2
pkgrel=1
pkgdesc="Free speedrun timer with auto splitting and load removal."
arch=('x86_64')
url='https://libresplit.org'
license=('GPL-3.0-or-later')
depends=(
    'gtk3'
    'jansson'
    'luajit'
)
makedepends=(
    'git'
    'meson'
)
provides=("$_pkgname")
conflicts=("$_pkgname")

source=("$_pkgname::git+https://github.com/LibreSplit/LibreSplit.git")
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=9 HEAD)"
}

build() {
    arch-meson $_pkgname build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
