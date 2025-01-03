# Maintainer: fossdd <fossdd@pwned.life>
# Contributor: fossdd <fossdd@pwned.life>

pkgname=xdg-desktop-portal-phosh
pkgver=0.44.0
pkgrel=0
pkgdesc='xdg-desktop-portal implementation using GTK/GNOME/Phosh'
arch=(x86_64 aarch64 riscv64)
url='https://gitlab.gnome.org/guidog/xdg-desktop-portal-phosh'
license=(GPL-3.0-or-later)
depends=(gsettings-desktop-schemas xdg-desktop-portal gnome-desktop-4 libadwaita)
makedepends=(meson)
source=("git+${url}.git#tag=v${pkgver}")
validpgpkeys=("0DB3932762F78E592F6522AFBB5A2C77584122D3")
sha256sums=('ccdf7fa29208d26ab93b7c52e8f11fe4ca2de7e8fd2a43f7404dd57ec9b5f531')

build() {
	arch-meson \
		--wrap-mode=default \
		xdg-desktop-portal-phosh build
	meson compile -C build
}

check() {
	meson test --no-rebuild --print-errorlogs -C build
}

package() {
	DESTDIR="${pkgdir}" meson install --no-rebuild -C build
}
