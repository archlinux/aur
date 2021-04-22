# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=libspng
pkgver=0.6.2
pkgrel=1
pkgdesc="C library for reading and writing PNG format files with a focus on security and ease of use"
arch=(x86_64 aarch64)
url="https://libspng.org/"
license=('BSD')
depends=(zlib)
makedepends=(meson)
checkdepends=(libpng)
source=("libspng-${pkgver}.tar.gz::https://github.com/randy408/libspng/archive/v${pkgver}.tar.gz")
sha256sums=('eb7faa3871e7a8e4c1350ab298b513b859fcb4778d15aa780a79ff140bcdfaf3')

build() {
	arch-meson build "libspng-${pkgver}"
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="$pkgdir" meson install -C build
	install -D "libspng-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/libspng/LICENSE"
}