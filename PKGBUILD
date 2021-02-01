# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=callaudiod
pkgver=0.1.0
pkgrel=1
pkgdesc="Call audio routing daemon"
arch=(i686 x86_64 armv7h aarch64)
url="https://gitlab.com/mobian1/callaudiod"
license=(GPL3)
depends=(alsa-lib glib2 libpulse)
makedepends=(meson)
source=("${url}/-/archive/${pkgver}/callaudiod-${pkgver}.tar.gz")
sha256sums=('eb9202af99e7d5fdfb0c20fcb64a0384a2024c9ca27a4c8ba45113eb0ffb97fc')

build() {
	arch-meson callaudiod-${pkgver} build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}
