# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=audio-sharing
pkgver=0.1.1
pkgrel=1
pkgdesc='Share your computer audio'
url='https://gitlab.gnome.org/World/AudioSharing'
license=(GPL3)
arch=(x86_64 aarch64)
depends=(
	gst-rtsp-server
	libadwaita
)
makedepends=(
	cargo
	meson
)
source=("${url}/-/archive/${pkgver}/AudioSharing-${pkgver}.tar.gz")
sha256sums=('f9b77d5be4fac8dfb659421705dc927774b4406bbaafa32b9a400699e26f8eec')

build() {
	arch-meson AudioSharing-${pkgver} build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}
