# Maintainer: Jakob Schlanstedt <schlanstedtjakob@gmail.com>
# Contributor: Jakob Schlanstedt <schlanstedtjakob@gmail.com>
pkgname=japokwm-git
_pkgname=japokwm
url=https://github.com/werererer/japokwm
pkgver=0.4.2.r52.g2ef563e5
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
    "libuv"
        )
provides=('japokwm' "$_pkgname")
conflicts=('japokwm' "$_pkgname")
backup=(
    'etc/japokwm/init.lua'
    'etc/japokwm/layouts/master/init.lua'
    'etc/japokwm/layouts/resize_test/init.lua'
    'etc/japokwm/layouts/two_pane/init.lua'
    'etc/japokwm/layouts/three_columns/init.lua'
    'etc/japokwm/layouts/monocle/init.lua'
    'etc/japokwm/layouts/tile/init.lua'
    'etc/japokwm/layouts/spiral/init.lua'
    'etc/japokwm/layouts/tmp/init.lua'
)

arch=("x86_64")
source=("$_pkgname::git+https://github.com/werererer/japokwm")
sha512sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    arch-meson "$_pkgname" build
    meson configure -Dxwayland=true build
    meson compile -C build
}

package() {
    DESTDIR="$pkgdir" meson install -C build
}
