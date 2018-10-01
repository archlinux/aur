# Maintainer: Sam Whited <sam@samwhited.com>

pkgname=writeas-gtk
pkgver=1.0.0
pkgrel=2
pkgdesc="Write.as GTK desktop app"
arch=('x86_64')
url="https://write.as/apps/desktop"
license=(GPL3)
depends=(
	'writeas-cli'
	'gtksourceview3'
	'gtk3'
)
makedepends=(
	'meson'
	'ninja'
	'vala'
)
source=(https://code.as/writeas/writeas-gtk/archive/v${pkgver}.tar.gz)
sha256sums=('c6487821b5fbeef38ee50082d42a89be97b2fdbd5c3205d8a9c961ca0c3c7fbf')

prepare() {
	mkdir -p build
}

build() {
	# Temporary workaround for https://github.com/mesonbuild/meson/issues/4247
	arch-meson "${pkgname}" build || arch-meson "${pkgname}" build --reconfigure
	ninja -C build
}

package() {
	DESTDIR="${pkgdir}" ninja install -C build
}
