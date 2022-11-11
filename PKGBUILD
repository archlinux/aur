# Maintainer: Tomasz Jakub Rup <tomasz.rup@gmail.com>
pkgname=cppzmq
pkgver=4.9.0
pkgrel=0
pkgdesc="Header-only C++ binding for libzmq (only CMake module)"
arch=('any')
url="https://github.com/zeromq/cppzmq"
license=('MIT')
makedepends=('cmake' 'zeromq>=4.2.0')
optdepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/zeromq/cppzmq/archive/v${pkgver}.tar.gz")
sha256sums=('3fdf5b100206953f674c94d40599bdb3ea255244dcc42fab0d75855ee3645581')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	mkdir -p build
}

build() {
	cd "$srcdir/$pkgname-$pkgver/build"
	cmake -D CMAKE_INSTALL_PREFIX=/usr -D CPPZMQ_BUILD_TESTS=OFF ..
}

package() {
	depends=('zeromq>=4.2.0')

	cd "$srcdir/$pkgname-$pkgver/build"
	make -j4 DESTDIR="$pkgdir/" install
	cd ..
	rm -rf "$pkgdir/usr/include"
	install -m 755 -d "$pkgdir/usr/share/licenses/$pkgname"
	install -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
