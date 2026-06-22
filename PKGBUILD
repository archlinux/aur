# Maintainer: Jimmy <jimmy@somewm.org>
pkgname=somewm
pkgver=1.4.2
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
sha256sums=('799bd0fd01f68899fbeb28d83d9dba6633f5e6e33767748d9c10e8e1354adb5a')

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
