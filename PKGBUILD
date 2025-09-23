# Maintainer: JakobDev<jakobdev at gmx dot de>

pkgname=mate-wayland-session
pkgver=1.28.4
pkgrel=1
pkgdesc="Wayland session using Wayfire for the MATE desktop"
arch=(any)
url="https://github.com/mate-desktop/mate-wayland-session"
license=("GPL-2.0-or-later")
depends=("wayfire" "mate-panel" "mate-polkit" "mate-notification-daemon" "mate-settings-daemon" "caja" "dbus" "network-manager-applet")
optdepends=("blueman: bluetooth applet" "gnome-keyring: keyring support")
makedepends=("meson")
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/mate-desktop/mate-wayland-session/archive/refs/tags/v${pkgver}.tar.gz"
    "fix-components.patch"
    "fix-ini-path.patch"
)
sha256sums=(
    "ffc65659ecbed6e95a2c0c929118530042ca9fa75cf5aa7def1106d1bf7bded7"
    "bb6df890982e79106a8aca4de1c9dc88720514dab4be6eeb5aabcfd436b113ed"
    "50ef3275c18e46480575d2feb72caed178325160e8232c08ae18907f30403d60"
)

prepare() {
    cd "mate-wayland-session-${pkgver}"
    patch -p 1 < ../fix-components.patch
    patch -p 1 < ../fix-ini-path.patch
}

build() {
    cd "mate-wayland-session-${pkgver}"
    arch-meson build
    meson compile -C build
}

package() {
    cd "mate-wayland-session-${pkgver}"
    meson install -C build --destdir "$pkgdir"
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
