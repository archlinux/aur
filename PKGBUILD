# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=gnome-text-editor
pkgver=41.1
pkgrel=2
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
_commit=${pkgver}
source=("${url}/-/archive/${_commit}/${pkgname}-${_commit}.tar.gz")
b2sums=('a6bf66e107f1ad5ce20395356f3ea628afeb0f12bf7568b4252337fa6417057eb7e0b13ccce646c5c630f01b2940cf039aa36dacc5fecd752ae1ddd07cf27997')

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
