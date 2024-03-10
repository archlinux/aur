# Maintainer: Campbell Jones <arch at serebit dot com>

pkgname=magpie-wm-v1-git
_pkgname=magpie
pkgver=r145.3f14a19
pkgrel=1
pkgdesc="Budgie's in-development Wayland compositor - latest git"
arch=("x86_64" "armv7h" "aarch64")
url="https://github.com/BuddiesOfBudgie/$_pkgname/tree/v1"
license=("Apache-2.0")
depends=("libxcb" "libxkbcommon" "wlroots" "wayland" "xorg-xwayland")
makedepends=("argparse" "git" "meson" "wayland-protocols")
source=("$_pkgname"::"git+https://github.com/BuddiesOfBudgie/${_pkgname}.git#branch=v1")
b2sums=("SKIP")

pkgver() {
    cd "$_pkgname"
    # revision number is commit count since first commit in branch
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    arch-meson "$_pkgname" build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
