# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Nahuel Gomez Castro <nahual_gomca@outlook.com.ar>

pkgname=icon-library
pkgver=0.0.11
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
_commit=a8b98c70afb082c27590e9f37b0e670df70903b2
source=("${url}/-/archive/${_commit}/${pkgname}-${_commit}.tar.gz")
b2sums=('1fc49c307a92706286763fb336cb0b9c909d5c06055e03ff01e24a9e5cdbca02d60fae9830b5e036ca9b51f3a866041414c1bd924be4bd9d8574befd1172b757')

build() {
	arch-meson "${pkgname}-${_commit}" build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}
