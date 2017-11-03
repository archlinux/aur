# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=mydumper
pkgver=0.9.3
pkgrel=1
pkgdesc="A high performance MySQL backup tool."
arch=("i686" "x86_64")
url="https://github.com/maxbube/mydumper"
license=('GPL')
depends=("glib2" "libmariadbclient")
makedepends=("cmake")

source=("https://github.com/maxbube/mydumper/archive/v$pkgver/$pkgname-$pkgver.tar.gz")

sha256sums=('2cd6a074bac7072905bd044ec20955c53c81b10e877ac9c644509940a8d201fb')

build() {
	mkdir -p build
	cd build

	cmake "$srcdir/$pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release
	make VERBOSE=1
}

package() {
	cd "$srcdir"/build
	make DESTDIR="$pkgdir" install
}
