# Maintainer: Yuki Takagi <takagiy.4dev@gmail.com>
pkgname=toml11-git
pkgver=3.2.1.r0.b1827e6
pkgrel=2
pkgdesc="A C++11 header-only toml parser/encoder depending only on C++ standard library"
arch=('any')
url="https://github.com/ToruNiina/toml11"
license=('MIT')
depends=()
makedepends=('git' 'cmake')
provides=('toml11')
conflicts=('toml11')
source=(${pkgname}::git+https://github.com/ToruNiina/toml11.git)
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/$pkgname"
	mkdir build
	cd build

	cmake .. -Dtoml11_BUILD_TEST=OFF -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$srcdir/$pkgname"
	cd build

	make DESTDIR="$pkgdir/" install
	install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
