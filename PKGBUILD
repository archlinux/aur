# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=decoder
pkgver=0.3.0
pkgrel=1
pkgdesc='Scan and Generate QR Codes'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/World/decoder'
license=(LGPL)
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
options=(debug)
source=("${url}/-/archive/${pkgver}/decoder-${pkgver}.tar.gz")
b2sums=('6bfdb60871cfc006bfa57762839e6c4345af6882f5a277cc2142d0a40383def8d7597fbeb248b29c62b2bdc0726f6361dd5daa539618e04ad85529af0a10e25c')

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
