# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=gnome-text-editor
pkgver=43.0
pkgrel=1
pkgdesc='Simple text editor that focuses on session management'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/GNOME/gnome-text-editor'
license=(GPL3)
depends=(
	editorconfig-core-c
	enchant
	gtksourceview5
	libadwaita
)
makedepends=(
	itstool
	meson
)
options=(debug)
_commit=${pkgver}
source=("${url}/-/archive/${_commit}/${pkgname}-${_commit}.tar.gz")
b2sums=('9b06c520a3695d258afcc010e6863ce1c66cbbd3fa096894dbe11da343e930c233363b671f920e28656690deb20e675c6d293d41b3c0f324ce14f71b9fb3797a')

build() {
	arch-meson ${pkgname}-${_commit} build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs || true
}

package() {
	DESTDIR="${pkgdir}" meson install -C build

	rm -rf "${pkgdir}/usr/share/gtksourceview-5"
}
