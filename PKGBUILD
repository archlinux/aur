# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=decoder
pkgver=0.2.1
pkgrel=1
pkgdesc='Scan and Generate QR Codes'
url='https://gitlab.gnome.org/World/decoder'
license=('LGPL')
arch=(x86_64 aarch64)
depends=(
	libadwaita
	pipewire
	zbar
)
makedepends=(
	cargo
	clang
	meson
)
source=("${url}/-/archive/${pkgver}/decoder-${pkgver}.tar.gz")
sha256sums=('eb38e5e727831e80a177f9d375b201920352c0b2009cbac92fdf7db0965e3bb6')

build() {
	arch-meson decoder-${pkgver} build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}
