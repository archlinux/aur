# Maintainer: ndiuky <anod100002@gmail.com>
# Contributor: Zander Brown <zbrown@gnome.org>

pkgname=someclick
pkgver=48.1_someclick
pkgrel=1
pkgdesc="Patched kgx (GNOME Console): right-click to copy/paste (as in Windows)"
url="https://github.com/ndiuky/someclick"
arch=(x86_64)
license=(GPL-3.0-or-later)
depends=(
	dconf
	gcc-libs
	glib2
	glibc
	gtk4
	hicolor-icon-theme
	libadwaita
	libgtop
	pango
	vte4
)
makedepends=(
	appstream
	git
	glib2-devel
	meson
)
groups=(gnome)
conflicts=("gnome-console")
provides=("gnome-console")
source=("git+https://github.com/ndiuky/someclick")
md5sums=("SKIP")

prepare() {
	cd $pkgname
}

build() {
	local meson_options=(
		-D tests=true
	)

	arch-meson $pkgname build "${meson_options[@]}"
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	meson install -C build --destdir "$pkgdir"
}
