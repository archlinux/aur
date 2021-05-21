# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=calls
pkgver=0.3.3
pkgrel=1
pkgdesc="Phone dialer and call handler"
arch=(x86_64 aarch64)
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
	sofia-sip
)
makedepends=(
	gobject-introspection
	meson
	vala
)
source=("${url}/-/archive/v${pkgver}/calls-v${pkgver}.tar.gz")
sha256sums=('e7daf320ad1dfb373e7fd92004bee57aec3e4fd2cf22eb3f14c98128efa04db9')

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
