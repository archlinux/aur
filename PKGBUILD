# Maintainer: Tomasz Jakub Rup <tomasz.rup@gmail.com>
pkgname=cppzmq
pkgver=4.8.1
pkgrel=2
pkgdesc="Header-only C++ binding for libzmq (only CMake module)"
arch=('any')
url="https://github.com/zeromq/cppzmq"
license=('MIT')
makedepends=('cmake' 'zeromq>=4.2.0')
optdepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/zeromq/cppzmq/archive/v${pkgver}.tar.gz")
sha256sums=('7a23639a45f3a0049e11a188e29aaedd10b2f4845f0000cf3e22d6774ebde0af')

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
