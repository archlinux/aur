# Maintainer: Jakob Schlanstedt <schlanstedtjakob@gmail.com>
# Contributor: Jakob Schlanstedt <schlanstedtjakob@gmail.com>
pkgname=japokwm-git
_pkgname=japokwm
url=https://github.com/werererer/japokwm
pkgver=v0.4.0
pkgrel=1
license=("BSD 2-Clause")
pkgdesc="A wlroots and dwl based tiling-windowmanager based around creating layouts"
depends=(
    "lua"
    )
makedepends=(
    "meson"
    "git"
    "wlroots"
    "wayland"
    "wayland-protocols"
    "libnotify"
    "scdoc"
        )

arch=("x86_64")
source=("$_pkgname::git+https://github.com/werererer/japokwm")
sha512sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    arch-meson "$_pkgname" build
    meson configure -Dxwayland=true build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
