# Maintainer: SingYan <singyan@tuta.io>

pkgname=mydumper
pkgver=0.14.3
pkgrel=1
pkgdesc="A high performance MySQL backup tool."
arch=("i686" "x86_64")
url="https://github.com/maxbube/mydumper"
license=('GPL')
depends=("glib2" "libmariadbclient" "pcre" "pcre2")
makedepends=("cmake")

source=("https://github.com/maxbube/mydumper/archive/v$pkgver-1/$pkgname-$pkgver-1.tar.gz")

sha256sums=('aafb9c0914b720e175988a41d9c340271348e50e3a00556035a9c4afcf80c982')

build() {
	mkdir -p build
	cd build

	cmake "$srcdir/$pkgname-$pkgver-1" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DWITH_SSL=OFF
	make VERBOSE=1
}

package() {
	cd "$srcdir"/build
	make DESTDIR="$pkgdir" install
}
