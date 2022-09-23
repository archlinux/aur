# Maintainer: Thomas Booker <tw.booker@outlook.com>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=phoc
pkgver=0.21.0.beta1
pkgrel=1
pkgdesc='#BROKEN USE phoc-embedded-wlroots# A pure Wayland shell prototype for GNOME on mobile devices'
arch=(x86_64 aarch64 armv7h)
url='https://gitlab.gnome.org/World/Phosh/phoc'
license=(GPL3)
depends=(
	gnome-desktop
	wlroots
)
makedepends=(
	meson
	git
)
_tag=ebc6d1d5a2acdc243af3c9237ac09bcdd8f727f2
source=("git+${url}.git#tag=${_tag}")
sha256sums=('SKIP')

pkgver() {
	cd phoc
	git describe --tags | sed 's/^v//;s/_/./'
}

# We don't use the wlroots submodule so we don't need to init and update the submodules

build() {
	arch-meson phoc _build -Dembed-wlroots=disabled -Dtests=false
	meson compile -C _build
}

package() {
	DESTDIR="${pkgdir}" meson install -C _build
}
