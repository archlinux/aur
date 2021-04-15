# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=gnome-text-editor
pkgver=3.39.92
pkgrel=1
pkgdesc="Simple text editor that focuses on session management"
url="https://gitlab.gnome.org/chergert/gnome-text-editor"
license=("GPL3")
arch=(i686 x86_64 armv7h aarch64)
depends=(gtksourceview5 libadwaita)
makedepends=(meson)
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d36adbf0e2c6d74380986d64aaaa8ad0aa39ffabb304648a94acfa0b2f9771b4')

build() {
	arch-meson ${pkgname}-${pkgver} build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="${pkgdir}" meson install -C build

	rm -rf "${pkgdir}/usr/share/gtksourceview-5"
}
