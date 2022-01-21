# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=decoder-git
pkgver=0.2.2.r2.g798b13d
pkgrel=1
pkgdesc='Scan and Generate QR Codes'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/World/decoder'
license=('GPL3')
depends=(
	libadwaita
	pipewire
	zbar
)
makedepends=(
	cargo
	clang
	git
	meson
)
provides=(decoder)
conflicts=(decoder)
source=("git+${url}.git")
b2sums=('SKIP')

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
