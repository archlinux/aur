# Maintainer: rotkonetworks <hq@rotko.net>
# PGP: 813CE099D6CE512BC29A15D841EE1853489958D6

pkgname=bspwm1-wl
pkgver=1.6.0
pkgrel=1
pkgdesc="bspwm as a Wayland compositor (wlroots backend of bspwm1)"
arch=('x86_64')
url="https://github.com/rotkonetworks/bspwm1"
license=('BSD-2-Clause')
depends=('bspwm1' 'wlroots0.20' 'wayland' 'libxkbcommon' 'pixman' 'libdrm' 'xorg-xwayland')
makedepends=('git' 'wayland-protocols' 'wlr-protocols')
optdepends=(
            'waybar: status bar'
            'rofi: launcher (has a native Wayland backend)'
            'dunst: notifications'
            'swaylock: screen locker'
            'swayidle: idle management')
# bspc comes from bspwm1, which this package depends on.
provides=('bspwm-wl')
# Pinned to the release tag, see pkg/arch/PKGBUILD for why.
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

pkgver() {
	cd "bspwm1"
	git describe --tags | sed 's/^v//;s/-/./g'
}

build() {
	cd "bspwm1"
	make BACKEND=wlroots
}

package() {
	cd "bspwm1"
	install -Dm755 bspwm-wl "$pkgdir/usr/bin/bspwm-wl"
	install -Dm644 contrib/freedesktop/bspwm-wayland.desktop \
		"$pkgdir/usr/share/wayland-sessions/bspwm-wayland.desktop"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
