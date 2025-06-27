# Maintainer: chirsz <chirsz-ever#outlook.com>

# This PKGBUILD is based on the official wlroots package

_pkgname=wlroots
pkgname=$_pkgname-nogpu
pkgver=0.18.2
pkgrel=2
license=('MIT')
pkgdesc='Modular Wayland compositor library. without GPU support'
url='https://gitlab.freedesktop.org/wlroots/wlroots'
arch=('x86_64')
depends=(
    'libdisplay-info.so'
    'libinput'
    'liblcms2.so'
    'libliftoff.so'
    'libpixman-1.so'
    'libseat.so'
    'libudev.so'
    'libwayland-client.so'
    'libwayland-server.so'
    'libxcb'
    'libxkbcommon.so'
    'xcb-util-errors'
    'xcb-util-renderutil'
    'xcb-util-wm'
)
makedepends=(
    'meson'
    'ninja'
    'systemd'
    'wayland-protocols'
    'xorg-xwayland'
)
optdepends=(
    'xorg-xwayland: Xwayland support'
)
provides=(
    "libwlroots-${pkgver%.*}.so"
    "wlroots"
    "wlroots0.18"
)
conflicts=("wlroots")
source=(
    "$_pkgname-$pkgver.tar.gz::https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/$pkgver/downloads/wlroots-$pkgver.tar.gz"
    "https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/$pkgver/downloads/wlroots-$pkgver.tar.gz.sig"
)
sha256sums=('cf776c169169f279808d9eabc6583f484338dcd454c966a285ff178c88c105d4'
            'SKIP')
validpgpkeys=(
    '34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48' # Simon Ser
    '9DDA3B9FA5D58DD5392C78E652CB6609B22DA89A' # Drew DeVault
    '4100929B33EEB0FD1DB852797BC79407090047CA' # Sway signing key
)

build() {
    arch-meson "$_pkgname-$pkgver" build -Drenderers=[] -Dallocators=[]
    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
    install -Dm644 "$_pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname/"
}
