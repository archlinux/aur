# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=calls
pkgver=0.3.4
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
sha256sums=('97cd5f689b9f1312b97ad99a44d10d35774a7d2b58d92446aa0101d2d11bfdf9')

build() {
	arch-meson calls-v${pkgver} build -D tests=false
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}
