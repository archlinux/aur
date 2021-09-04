# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=decoder-git
pkgver=0.2.1.r5.g46f340e
pkgrel=1
pkgdesc='Scan and Generate QR Codes'
url='https://gitlab.gnome.org/World/decoder'
license=('GPL3')
arch=(x86_64 aarch64)
depends=(
	libadwaita
	pipewire
	zbar
)
makedepends=(
	cargo
	git
	meson
)
provides=(decoder)
conflicts=(decoder)
source=("git+${url}.git")
sha256sums=('SKIP')

build() {
	arch-meson decoder build
	meson compile -C build
}

pkgver() {
	cd decoder
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="$pkgdir/" meson install -C build
}
