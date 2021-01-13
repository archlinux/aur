# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=calls
pkgver=0.2.0
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
sha256sums=('98c4963b8c69fb0de88aaf0133c7fc483d954d8e487c53e014768ff8f2f4ee12')

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
