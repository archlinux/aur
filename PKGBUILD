# Maintainer: Brett Cornwall <ainola@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Maxim Baz <archlinux at maximbaz dot com>
# Contributor: Omar Pakker

pkgname=wlroots-0.19
_pkgname=wlroots
pkgver=0.19.0
pkgrel=1
license=('MIT')
pkgdesc='Modular Wayland compositor library'
url='https://gitlab.freedesktop.org/wlroots/wlroots'
arch=('x86_64')
depends=(
    'libdisplay-info.so'
    'libglvnd'
    'libinput'
    'liblcms2.so'
    'libliftoff.so'
    'libpixman-1.so'
    'libseat.so'
    'libudev.so'
    'libvulkan.so'
    'libwayland-client.so'
    'libwayland-server.so'
    'libxcb'
    'libxkbcommon.so'
    'opengl-driver'
    'xcb-util-errors'
    'xcb-util-renderutil'
    'xcb-util-wm'
)
makedepends=(
    'glslang'
    'meson'
    'ninja'
    'systemd'
    'vulkan-headers'
    'wayland-protocols'
    'xorg-xwayland'
)
optdepends=(
    'xorg-xwayland: Xwayland support'
)
provides=(
    "libwlroots-${pkgver%.*}.so"
)
source=(
    "$_pkgname-$pkgver.tar.gz::https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/$pkgver/downloads/wlroots-$pkgver.tar.gz"
    "https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/$pkgver/downloads/wlroots-$pkgver.tar.gz.sig"
)
sha256sums=('aefb0fe2633b0aad1d66123b2f41afab004fb625e2a7790492cdd39a805cac91' 'SKIP')

validpgpkeys=(
    '34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48' # Simon Ser
    '9DDA3B9FA5D58DD5392C78E652CB6609B22DA89A' # Drew DeVault
    '4100929B33EEB0FD1DB852797BC79407090047CA' # Sway signing key
)


build() {
    arch-meson "$_pkgname-$pkgver" build
    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
    install -Dm644 "$_pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}

