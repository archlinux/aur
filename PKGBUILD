# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=callaudiod-git
pkgver=0.1.4.r0.ga7ca6ce
pkgrel=1
pkgdesc='Call audio routing daemon'
arch=(x86_64 aarch64)
url='https://gitlab.com/mobian1/callaudiod'
license=(GPL3)
depends=(alsa-lib glib2 libpulse)
makedepends=(git meson)
provides=(callaudiod)
conflicts=(callaudiod)
options=(debug)
source=("git+${url}.git")
b2sums=(SKIP)

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
