# Maintainer: Pedro "EXtremeExploit" Montes Alcalde <pedro.montes.alcalde@gmail.com>

_pkgname="pepv"
pkgname="$_pkgname-git"
pkgver=r36.03f31b33d
pkgrel=1
pkgdesc="Pacman local packages viewer"
arch=('x86_64')
url="https://github.com/EXtremeExploit/pepv"
license=('GPL-2.0-only')
makedepends=(
    git
    meson
    imagemagick
)
depends=(
    gtk3
    libalpm.so
)
provides=('pepv')
conflicts=('pepv')
source=(
    "$_pkgname"::"git+$url.git"
)
sha256sums=(
    'SKIP'
)

pkgver() {
    cd $_pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=9 HEAD)"
}

prepare() {
    meson subprojects download --sourcedir=$_pkgname
}

build() {
    arch-meson $_pkgname build -Dtracy_enable=false
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir" --skip-subprojects
}
