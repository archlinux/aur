# Maintainer: Thomas Booker (CoderThomasB) <tw.booker@outlook.com>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=callaudiod
pkgver=0.1.7
pkgrel=1
pkgdesc='Call audio routing daemon'
arch=(x86_64 aarch64)
url='https://gitlab.com/mobian1/callaudiod'
license=(GPL3)
depends=(alsa-lib glib2 libpulse)
makedepends=(meson)
source=("${url}/-/archive/${pkgver}/callaudiod-${pkgver}.tar.gz")
b2sums=('ae7a30bd41c9614460c8ad58548f8d5fea98746e789d771c8a16449aff36328035e0b2046929d8b5886f18cf00f9a56abfb2bee9ed312f1f6e60aa4259d51dfe')

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
