# Maintainer: fossdd <fossdd@pwned.life>
# Contributor: fossdd <fossdd@pwned.life>

pkgname=xdg-desktop-portal-phosh-git
pkgver=v0.42.0.r0.gd53d18b
pkgrel=2
pkgdesc='xdg-desktop-portal implementation using GTK/GNOME/Phosh'
arch=(x86_64 aarch64 riscv64)
url='https://gitlab.gnome.org/guidog/xdg-desktop-portal-phosh'
license=(GPL-3.0-or-later)
depends=(gsettings-desktop-schemas xdg-desktop-portal gnome-desktop-4 libadwaita)
makedepends=(meson)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd xdg-desktop-portal-phosh
	git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	arch-meson xdg-desktop-portal-phosh build
	meson compile -C build
}

check() {
	meson test --no-rebuild --print-errorlogs -C build
}

package() {
	DESTDIR="${pkgdir}" meson install --no-rebuild -C build
}
