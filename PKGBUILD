# Maintainer: minus <minus@mnus.de>
pkgname=libpaseto
pkgver=1.0
pkgrel=1
pkgdesc="C implementation of PASETO (v2 tokens only)"
arch=('x86_64')
url="https://github.com/authenticvision/libpaseto"
license=('MIT')
depends=('libsodium')
makedepends=('cmake')
source=("https://github.com/authenticvision/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('a0a2e830fb4d4116b4ffc78a72d96c8f9dff42aa226bb02681a0f4495069286a')

build() {
	cd "$pkgname-$pkgver"
	cmake -B build -DCMAKE_INSTALL_PREFIX=/usr
	make -C build
}

check() {
	cd "$pkgname-$pkgver"
	build/pasetotest
}

package() {
	cd "$pkgname-$pkgver"
	make -C build DESTDIR="$pkgdir/" install
}

