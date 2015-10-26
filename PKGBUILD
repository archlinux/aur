# Maintainer: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
pkgname=libcue-git
pkgver=v1.4.0.r8.62a4b71
pkgrel=1
pkgdesc="CUE Sheet Parser Library"
arch=('i686' 'x86_64')
url="https://github.com/lipnitsk/libcue"
license=('GPL2')
makedepends=('git' 'cmake' 'flex' 'bison')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('libcue::git+https://github.com/lipnitsk/libcue.git#commit=62a4b71')
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr $srcdir/${pkgname%-git}
	make
}

check() {
	cd build
	make -k test
}

package() {
	cd build
	make DESTDIR="$pkgdir/" install
}
