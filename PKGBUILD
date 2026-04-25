# Maintainer: Jimmy <your-email@example.com>
pkgname=somewm
pkgver=1.4.1
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
sha256sums=('a9cec46c38184b5141bc7bc6f72838f3ae0428bcaec7ee558839f08e518d0369')

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
