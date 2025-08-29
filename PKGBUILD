# Maintainer: ARKye03 <rafa03-dev@proton.me>

pkgname=morghulis-git
pkgver=v0.12.0.r11.g731991c
pkgrel=1
pkgdesc="Wayland GTK4 Desktop Shell (Development Version)"
arch=(x86_64)
license=('MIT')
url="https://github.com/ARKye03/morghulis"
depends=(
	gtk4
	gtk4-layer-shell
	glib2
	libnm
	libadwaita
	libastal-mpris-git
	libastal-notifd-git
	libastal-network-git
	libastal-wireplumber-git
	libastal-tray-git
	libastal-apps-git
	libastal-bluetooth-git
	libastal-battery-git
	libastal-powerprofiles-git
	libgtop
	gsound
)
optdepends=(
	'libastal-hyprland-git: Hyprland support'
	'libastal-river-git: River support'
)
makedepends=(
	git
	gobject-introspection
	vala
	meson
	dart-sass
	blueprint-compiler
)
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')
install=morghulis.install
provides=('morghulis')
conflicts=('morghulis')

pkgver() {
	cd "$pkgname" || exit
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname" || exit
  arch-meson build
	meson compile -C build
}

package() {
	cd "$pkgname" || exit
	meson install -C build --destdir "$pkgdir"
}
