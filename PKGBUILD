# Maintainer: Ghassan Alduraibi <git@ghassan.dev>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=squeekboard
pkgver=1.19.0
pkgrel=1
pkgdesc='An on-screen-keyboard input method for Wayland'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/World/Phosh/squeekboard'
license=(GPL3)
depends=(
	feedbackd
	gnome-desktop
	python
)
makedepends=(
	pkg-config
	meson
	intltool
	rust
	gtk-doc
	wayland-protocols
)
_commit=v${pkgver}
source=("${url}/-/archive/${_commit}/squeekboard-${_commit}.tar.gz")
b2sums=('92e2d5e7f4a6eadb88862f48eaccd576724b472ddf348280f5fcb2c8a040ffd04b9b89c74389936e367e287eb151436f0e6b81db08e9d4d8c7390dee8b60935d')

build() {
	arch-meson "squeekboard-${_commit}" build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}
