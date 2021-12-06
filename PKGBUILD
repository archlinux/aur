# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Nahuel Gomez Castro <nahual_gomca@outlook.com.ar>

pkgname=icon-library
pkgver=0.0.9
pkgrel=1
pkgdesc='Find the right symbolic icon to use on your GNOME application'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/World/design/icon-library'
license=(GPL3)
depends=(
	gtksourceview5
	libadwaita
)
makedepends=(
	meson
	rust
)
checkdepends=(appstream-glib)
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('3eed8f6d978f3b6acd2611795de5a8a95c632d14fed3f589ad7cfd00a63684e1')

build() {
	arch-meson "${pkgname}-${pkgver}" build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}
