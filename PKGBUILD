# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=libspng
pkgver=0.6.3
pkgrel=1
pkgdesc="C library for reading and writing PNG format files with a focus on security and ease of use"
arch=(x86_64 aarch64)
url="https://libspng.org/"
license=('BSD')
depends=(zlib)
makedepends=(meson)
checkdepends=(libpng)
source=("libspng-${pkgver}.tar.gz::https://github.com/randy408/libspng/archive/v${pkgver}.tar.gz")
sha256sums=('381e4073221a8fbdb54b3022ac7ede6a62ec944dcf30599e4565ebb52b311dd8')

build() {
	arch-meson build "libspng-${pkgver}" -D dev_build=true
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="$pkgdir" meson install -C build
	install -D "libspng-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/libspng/LICENSE"
}
