# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=mydumper
pkgver=0.10.3
pkgrel=1
pkgdesc="A high performance MySQL backup tool."
arch=("i686" "x86_64")
url="https://github.com/maxbube/mydumper"
license=('GPL')
depends=("glib2" "libmariadbclient")
makedepends=("cmake")

source=("https://github.com/maxbube/mydumper/archive/v$pkgver/$pkgname-$pkgver.tar.gz")

sha256sums=('571f0544ed60359dbcc933f439bd76741d6a51edcee0b1528f4c84e0bd521d9f')

build() {
	mkdir -p build
	cd build

	cmake "$srcdir/$pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DWITH_SSL=OFF
	make VERBOSE=1
}

package() {
	cd "$srcdir"/build
	make DESTDIR="$pkgdir" install
}
