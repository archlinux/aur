# Maintainer: Vescrity <vescrity@foxmail.com>
_pkgname=frzscr
pkgname="$_pkgname-git"
pkgver=r81.9ae7e9f
pkgrel=1
pkgdesc="screen freezing program for wayland"
arch=('x86_64' 'aarch64')
url="https://github.com/heather7283/frzscr"
license=('GPL-3.0-only')
depends=(glibc wayland)
provides=($_pkgname)
conflicts=()
makedepends=(git meson ninja)
source=("git+https://github.com/heather7283/frzscr")
sha256sums=('SKIP')
prepare() {
    cd $_pkgname
    meson setup build
}
pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
build() {
    arch-meson "${_pkgname}" build ${_meson_options}
    ninja -C build
}

package() {
    DESTDIR="${pkgdir}/" ninja -C build install
}
