# Maintainer: Jimmy <your-email@example.com>
pkgname=somewm
pkgver=1.4.0
pkgrel=1
pkgdesc="AwesomeWM ported to Wayland - 100% Lua API compatible"
arch=('x86_64')
url="https://github.com/trip-zip/somewm"
license=('GPL-3.0-or-later')
depends=(
    'cairo'
    'dbus'
    'gdk-pixbuf2'
    'glib2'
    'libdisplay-info'
    'libdrm'
    'libinput'
    'libliftoff'
    'libxcb'
    'libxkbcommon'
    'lua51-lgi'
    'luajit'
    'pango'
    'pixman'
    'seatd'
    'vulkan-icd-loader'
    'wayland'
    'xcb-util-errors'
    'xcb-util-renderutil'
    'xcb-util-wm'
)
makedepends=(
    'glslang'
    'hwdata'
    'meson'
    'ninja'
    'vulkan-headers'
    'wayland-protocols'
    'xcb-util'
    'xorg-xwayland'
)
optdepends=(
    'xorg-xwayland: X11 application support'
)
provides=('somewm')
conflicts=('somewm-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/trip-zip/somewm/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('408a9b4513d3cbff0277d72b1c963b6785f2772523e9752a3ab66ec13a9acf6c')

build() {
    cd "$pkgname-$pkgver"
    arch-meson build \
        --wrap-mode=default \
        -Db_sanitize=none \
        -Dwerror=false
    meson compile -C build
}

package() {
    cd "$pkgname-$pkgver"
    meson install -C build --destdir "$pkgdir" --skip-subprojects wlroots
}
