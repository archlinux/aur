# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=callaudiod
pkgver=0.1.1
pkgrel=1
pkgdesc='Call audio routing daemon'
arch=(x86_64 aarch64)
url='https://gitlab.com/mobian1/callaudiod'
license=(GPL3)
depends=(alsa-lib glib2 libpulse)
makedepends=(meson)
source=("${url}/-/archive/${pkgver}/callaudiod-${pkgver}.tar.gz")
sha256sums=('950036e95a920bdaae74ec61912a3588b7e743b808c2c5a77337709351d4b227')

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
