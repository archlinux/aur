# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=mydumper
pkgver=0.9.5
pkgrel=1
pkgdesc="A high performance MySQL backup tool."
arch=("i686" "x86_64")
url="https://github.com/maxbube/mydumper"
license=('GPL')
depends=("glib2" "libmariadbclient")
makedepends=("cmake")

source=("https://github.com/maxbube/mydumper/archive/v$pkgver/$pkgname-$pkgver.tar.gz")

sha256sums=('544d434b13ec192976d596d9a7977f46b330f5ae3370f066dbe680c1a4697eb6')

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
