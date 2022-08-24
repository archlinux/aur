# Maintainer: Thomas Booker <tw.booker@outlook.com>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=phoc-embedded-wlroots
pkgver=0.21.0
pkgrel=1
pkgdesc='A pure Wayland shell prototype for GNOME on mobile devices (wlroots embedded)'
arch=(x86_64 aarch64 armv7h)
url='https://gitlab.gnome.org/World/Phosh/phoc'
license=(GPL3)
depends=(
	seatd
	xcb-util-errors
	xcb-util-renderutil
	xcb-util-wm
	gnome-desktop
)
makedepends=(
	ctags
	git
	libhandy
	meson
	vala
	vulkan-headers
	wayland-protocols
)
provides=(phoc)
conflicts=(phoc wlroots)
_tag=1a58a2363b686241647138a8822beac4f761f3fb
source=("git+${url}.git#tag=${_tag}")
sha256sums=('SKIP')

pkgver() {
	cd phoc
	git describe --tags | sed 's/^v//'
}

prepare() {
	cd phoc

	git submodule init
	git submodule update
}

build() {
	arch-meson phoc _build -Dembed-wlroots=enabled -Dtests=false
	meson compile -C _build
}

package() {
	DESTDIR="${pkgdir}" meson install -C _build
}
