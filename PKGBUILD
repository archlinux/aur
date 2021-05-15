# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=gnome-text-editor
pkgver=40.0
pkgrel=1
pkgdesc='Simple text editor that focuses on session management'
url='https://gitlab.gnome.org/GNOME/gnome-text-editor'
license=('GPL3')
arch=(x86_64 aarch64)
depends=(gtksourceview5 libadwaita)
makedepends=(meson)
_commit='0e72a3a1535821301f9675566154586d53f2ea8d' # 40.0
source=("${url}/-/archive/${_commit}/${pkgname}-${_commit}.tar.gz")
sha256sums=('54faa47758b8fb0be25ff5dc0c54d768a35d18d4a0d2b94c3ef48dbefd073ff3')

build() {
	arch-meson ${pkgname}-${_commit} build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="${pkgdir}" meson install -C build

	rm -rf "${pkgdir}/usr/share/gtksourceview-5"
}
