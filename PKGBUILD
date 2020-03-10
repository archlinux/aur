# Maintainer: Yuki Takagi <takagiy.4dev@gmail.com>
pkgname=immer-git
pkgver=0.6.2.r51.b8e39a0
pkgrel=1
pkgdesc="Postmodern immutable and persistent data structures for C++"
arch=('any')
url="https://github.com/arximboldi/immer"
license=('Boost')
depends=()
makedepends=('git' 'cmake')
provides=('utfcpp')
conflicts=('utfcpp')
source=(${pkgname}::git+https://github.com/arximboldi/immer.git)
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/$pkgname"
	mkdir build
	cd build

	cmake .. -Dimmer_BUILD_EXAMPLES=Off -Dimmer_BUILD_TESTS=Off -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$srcdir/$pkgname"
	cd build

	make DESTDIR="$pkgdir/" install
	install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
