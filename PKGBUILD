# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname=stormlib
pkgname=$_pkgname-git
pkgver=9.20.227.gc5fb5c7
pkgrel=1
pkgdesc="A C/C++ API to read and write MPQ files"
arch=("i686" "x86_64")
url="http://www.zezula.net/en/mpq/stormlib.html"
license=("MIT")
depends=("bzip2" "zlib")
makedepends=("git" "cmake")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/ladislav-zezula/$_pkgname.git")
sha256sums=("SKIP")


pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --always | sed "s/-/./g" | sed "s/^v//"
}

build() {
	cd "$srcdir/$_pkgname"
	mkdir -p build
	cd build
	cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$srcdir/$_pkgname"
	cd build
	make DESTDIR="$pkgdir" install
}
