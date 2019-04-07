# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname=StormLib
pkgname=${_pkgname,,}
pkgver=9.22
pkgrel=1
pkgdesc="A C/C++ API to read and write MPQ files with support for merged archives, patch MPQs and more."
arch=("i686" "x86_64")
url="http://www.zezula.net/en/mpq/stormlib.html"
license=("MIT")
depends=("bzip2" "zlib")
makedepends=("cmake")
source=("$_pkgname-$pkgver.tar.gz::https://github.com/ladislav-zezula/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=("7ed583aae5549ba1abc68a8fc9a642b28323cdf835941bd9b2b549a7b623e53d")


build() {
	mkdir -p build
	cd build
	cmake "$srcdir/$_pkgname-$pkgver" \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
}
