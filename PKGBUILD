# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=calls
pkgver=0.3.0
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
sha256sums=('96fc7622500bd5cf5d60f045734004b5a8761609efbad86631a05b53407574a3')

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
