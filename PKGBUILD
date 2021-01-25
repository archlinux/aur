# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=feedbackd-git
pkgver=0.0.0+git20210125.r0.gaac3306
pkgrel=1
pkgdesc="A daemon to provide haptic, visual, and audio feedback on events"
url="https://source.puri.sm/Librem5/feedbackd"
license=(GPL3)
arch=(i686 x86_64 armv7h aarch64)
provides=(feedbackd)
conflicts=(feedbackd)
depends=(
	dconf
	gsound
	json-glib
	libgudev
)
makedepends=(
	git
	gobject-introspection
	meson
	vala
)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd feedbackd
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	arch-meson feedbackd build -Dgtk_doc=true -Dman=true
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}
