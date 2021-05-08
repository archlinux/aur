# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=calls
pkgver=0.3.2
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
sha256sums=('febdb70a0d6a4985971465818252f42b99dded20ded2fdb07f8981624f1510fa')

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
