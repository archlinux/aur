# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=callaudiod-git
pkgver=0.1.1.r0.gc9550e1
pkgrel=1
pkgdesc='Call audio routing daemon'
arch=(x86_64 aarch64)
url='https://gitlab.com/mobian1/callaudiod'
license=(GPL3)
depends=(alsa-lib glib2 libpulse)
makedepends=(git meson)
provides=(callaudiod)
conflicts=(callaudiod)
source=("git+${url}.git")
md5sums=(SKIP)

pkgver() {
	cd callaudiod
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	arch-meson callaudiod build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}
