# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=libspng-git
pkgver=0.6.2.r17.g573f2db
pkgrel=1
pkgdesc="C library for reading and writing PNG format files with a focus on security and ease of use"
arch=(x86_64 aarch64)
url="https://libspng.org/"
license=('BSD')
depends=(zlib)
makedepends=(git meson)
checkdepends=(libpng)
provides=(libspng)
conflicts=(libspng)
source=("git+https://gitlab.com/randy408/libspng.git")
sha256sums=('SKIP')

pkgver() {
	cd libspng
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	arch-meson build libspng
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="$pkgdir" meson install -C build
	install -D "libspng/LICENSE" "${pkgdir}/usr/share/licenses/libspng-git/LICENSE"
}