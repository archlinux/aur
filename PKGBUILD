# Maintainer: Yuki Takagi <takagiy.4dev@gmail.com>
pkgname=utfcpp-git
pkgver=3.1.r13.dc2442c
pkgrel=3
pkgdesc="UTF-8 with C++ in a Portable Way"
arch=('any')
url="https://github.com/nemtrif/utfcpp"
license=('Boost')
depends=()
makedepends=('git' 'cmake')
provides=('utfcpp')
conflicts=('utfcpp')
source=(${pkgname}::git+https://github.com/nemtrif/utfcpp.git)
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/$pkgname"
	mkdir build
	cd build

	cmake .. -DUTF8_TESTS=Off -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$srcdir/$pkgname"
	cd build

	make DESTDIR="$pkgdir/" install
	install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
