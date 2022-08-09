# Maintainer: ThatOneCalculator <kainoa@t1c.dev>

_pkgname="hyprland"
pkgname="${_pkgname}-bin"
pkgver="0.10.0beta"
pkgrel=1
pkgdesc="A dynamic tiling Wayland compositor based on wlroots that doesn't sacrifice on its looks."
arch=('x86_64' 'i686')
url="https://github.com/hyprwm/Hyprland"
license=('BSD')
depends=(
	libxcb
	xcb-proto
	xcb-util
	xcb-util-keysyms
	libxfixes
	libx11
	libxcomposite
	xorg-xinput
	libxrender
	pixman
	wayland-protocols
	cairo
	pango
	polkit
	glslang
	libinput
	libxcb
	libxkbcommon
	opengl-driver
	pixman
	wayland
	xcb-util-errors
	xcb-util-renderutil
	xcb-util-wm
	seatd
	vulkan-icd-loader
	vulkan-validation-layers
	xorg-xwayland)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hyprwm/Hyprland/releases/download/v${pkgver}/v${pkgver}.tar.gz")
sha256sums=('350e3422aed1a9b5bf5ab7215b0a4d64d98d9d558e9687df6adfba9c9df6551b')
conflicts=("${_pkgname}")
provides=(hyprland)

package() {
	cd hyprland
	mkdir -p "${pkgdir}/usr/share/wayland-sessions"
	mkdir -p "${pkgdir}/usr/share/hyprland"
	install -Dm755 ./Hyprland -t "${pkgdir}/usr/bin"
	install -Dm755 ./hyprctl -t "${pkgdir}/usr/bin"
	install -Dm755 ./libwlroots.so.11032 -t "${pkgdir}/usr/lib"
	install -Dm644 assets/*.png -t "${pkgdir}/usr/share/hyprland"
	install -Dm644 example/hyprland.desktop -t "${pkgdir}/usr/share/wayland-sessions"
	install -Dm644 example/hyprland.conf -t "${pkgdir}/usr/share/hyprland"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
