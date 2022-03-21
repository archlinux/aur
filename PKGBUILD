# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=gnome-text-editor
pkgver=42.0
pkgrel=1
pkgdesc='Simple text editor that focuses on session management'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/GNOME/gnome-text-editor'
license=(GPL3)
depends=(
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
b2sums=('487551dd81472d018a693da27041b9103bdff57adf5b64af22abf723f1867322645c31dc4ff8decdadf1863b7a58fdaff9f1c26dd4e170dd10a6dc7e9e6c2842')

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
