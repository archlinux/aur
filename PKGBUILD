# Maintainer: fossdd <fossdd@pwned.life>
# Contributor: fossdd <fossdd@pwned.life>

pkgname=xdg-desktop-portal-phosh
pkgver=0.42.0
pkgrel=2
pkgdesc='xdg-desktop-portal implementation using GTK/GNOME/Phosh'
arch=(x86_64 aarch64 riscv64)
url='https://gitlab.gnome.org/guidog/xdg-desktop-portal-phosh'
license=(GPL-3.0-or-later)
depends=(gsettings-desktop-schemas xdg-desktop-portal gnome-desktop-4 libadwaita)
makedepends=(meson)
source=("git+${url}.git#tag=v${pkgver}")
validpgpkeys=("0DB3932762F78E592F6522AFBB5A2C77584122D3")
sha256sums=('f6a56e3a246699194b8906d9496186a6d2e4d7cc24279ba748ee872c1be4f15b')

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
