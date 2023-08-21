# Maintainer: Thomas Booker (CoderThomasB) <tw.booker@outlook.com>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=callaudiod
pkgver=0.1.9
pkgrel=1
pkgdesc='Call audio routing daemon'
arch=(x86_64 aarch64)
url='https://gitlab.com/mobian1/callaudiod'
license=(GPL3)
depends=(alsa-lib glib2 libpulse)
makedepends=(meson)
source=("${url}/-/archive/${pkgver}/callaudiod-${pkgver}.tar.gz")
b2sums=('b45399407e5fb601caac974ea11303c5642fd2d09a15e5848775a02b52e1fc5093a8dd0861b6bb7beed12a069a9339f4d2170352f49f99bd7fc66beaf012c982')

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
