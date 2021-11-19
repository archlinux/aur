# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=audio-sharing-git
pkgver=0.1.2.r8.gd470e61
pkgrel=1
pkgdesc='Share your computer audio'
url='https://gitlab.gnome.org/World/AudioSharing'
license=(GPL3)
arch=(x86_64 aarch64)
provides=(audio-sharing)
conflicts=(audio-sharing)
depends=(
	gst-rtsp-server
	libadwaita
)
makedepends=(
	cargo
	git
	meson
)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd AudioSharing
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	arch-meson AudioSharing build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}
