# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Nahuel Gomez Castro <nahual_gomca@outlook.com.ar>

pkgname=icon-library
pkgver=0.0.8
pkgrel=1
pkgdesc='Find the right symbolic icon to use on your GNOME application'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/World/design/icon-library'
license=(GPL3)
depends=(
	gtksourceview4
	libhandy
)
makedepends=(
	cmake
	meson
	rust
)
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('7aaebac60d615138971327a064f7a39ca19ea69e78c27b5fee04de0be76d135c')

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
