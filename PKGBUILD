# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=libspng-git
pkgver=0.7.2.r4.gd981609
pkgrel=1
pkgdesc='C library for reading and writing PNG format files with a focus on security and ease of use'
arch=(x86_64 aarch64)
url='https://libspng.org/'
license=(BSD)
depends=(zlib)
makedepends=(git meson)
provides=(libspng)
conflicts=(libspng)
source=('git+https://gitlab.com/randy408/libspng.git')
b2sums=('SKIP')

pkgver() {
	cd libspng
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	arch-meson build libspng
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
	install -D "libspng/LICENSE" "${pkgdir}/usr/share/licenses/libspng-git/LICENSE"
}
