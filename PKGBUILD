# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=audio-sharing
pkgver=0.1.2
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
sha256sums=('1fea93f41d84eb961971fb814f4216f0663a84a22795305cc951ed4f83388ffa')

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
