# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=decoder
pkgver=0.2.0
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
source=("${url}/-/archive/${pkgver}/decoder-${pkgver}.tar.gz")
sha256sums=('0c44273ba830799221df1e021f98ec6b1da55a878e150aec01d4d604ad74c2cc')

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
