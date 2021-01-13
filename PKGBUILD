# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=calls-git
pkgver=0.2.0.r3.gddab47d
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
    git
	gobject-introspection
	meson
	vala
)
provides=(calls)
conflicts=(calls)
source=("git+${url}.git")
md5sums=(SKIP)

pkgver() {
	cd calls
	git describe --long --tags | sed 's/^pureos\///;s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	arch-meson calls build -Dtests=false
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}
