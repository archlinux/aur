# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=calls
pkgver=0.3.1
pkgrel=1
pkgdesc="Phone dialer and call handler"
arch=(i686 x86_64 armv7h aarch64)
url="https://source.puri.sm/Librem5/calls"
license=(GPL3)
depends=(
	callaudiod
	feedbackd
	folks
	gom
	libhandy
	libpeas
	modemmanager
)
makedepends=(
	gobject-introspection
	meson
	vala
)
source=("${url}/-/archive/v${pkgver}/calls-v${pkgver}.tar.gz")
sha256sums=('6b0928e3b40819082a0b409b09f94c6698dd78af0b516cb2b5d389ed351b1c55')

build() {
	arch-meson calls-v${pkgver} build -Dtests=false
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}
