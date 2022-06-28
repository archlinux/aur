# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=decoder
pkgver=0.3.1
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
b2sums=('d7ff26bd61ced48862ce26955a7989644222c4b2cc101e4ad5f5fec54cffad73c7f34401adc8cd4762eab2b1335985c97e398742c22d222309d24b22c25a9098')

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
