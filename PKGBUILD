# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=decoder
pkgver=0.1.0
pkgrel=1
pkgdesc='Scan and Generate QR Codes'
url='https://gitlab.gnome.org/World/decoder'
license=('LGPL')
arch=(x86_64 aarch64)
depends=(
	libadwaita
	zbar
)
makedepends=(
	cargo
	meson
)
_commit=d48971d5833c270d1dd77cf0d984e1ac8315e67d
source=("${url}/-/archive/${_commit}/decoder-${_commit}.tar.gz")
sha256sums=('ff0070923ac5a44532985c3dbe679a325625d2bae74f2cc1635baa876b51a594')

build() {
	arch-meson decoder-${_commit} build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}
