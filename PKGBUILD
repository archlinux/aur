# Maintainer: Jimmy <jimmy@somewm.org>
pkgname=somewm
pkgver=1.4.6
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
    'libinput'
    'libxcb'
    'libxkbcommon'
    'lua51-lgi'
    'luajit'
    'pam'
    'pango'
    'wayland'
    'wlroots0.20'
    'xcb-util-wm'
)
makedepends=(
    'meson'
    'ninja'
    'wayland-protocols'
)
optdepends=(
    'xorg-xwayland: X11 application support'
)
provides=('somewm')
conflicts=('somewm-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/trip-zip/somewm/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('467e0d1af1d6625e9e4733e15c6eccc7be50459768a4d062fbe963b54340c243')

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
    meson install -C build --destdir "$pkgdir" --skip-subprojects
}
