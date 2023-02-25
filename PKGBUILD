# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=callaudiod
pkgver=0.1.4
pkgrel=1
pkgdesc='Call audio routing daemon'
arch=(x86_64 aarch64)
url='https://gitlab.com/mobian1/callaudiod'
license=(GPL3)
depends=(alsa-lib glib2 libpulse)
makedepends=(meson)
source=("${url}/-/archive/${pkgver}/callaudiod-${pkgver}.tar.gz")
b2sums=('27315e27b3f7d2485a811ee9c2d32bfb09fa970626791cbdd20307bdb3a183493b1985814030ab9668444134c6c1369630251ac82f191c5b3185bf449d20ac1f')

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
