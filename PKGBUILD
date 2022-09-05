# Maintainer: John A. Leuenhagen <john@zlima12.com>

pkgname=cpr
pkgver=1.9.2
pkgrel=1
pkgdesc='C++ Requests: Curl for People, a spiritual port of Python Requests.'
arch=('i686' 'x86_64')
url="https://github.com/libcpr/cpr"
license=('MIT')
depends=('curl')
makedepends=('cmake')
source=("https://github.com/libcpr/cpr/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('3bfbffb22c51f322780d10d3ca8f79424190d7ac4b5ad6ad896de08dbd06bf31')

prepare() {
	cd "$srcdir/cpr-$pkgver"
	cmake -DCMAKE_BUILD_TYPE=Release -DCPR_BUILD_TESTS=OFF -DCPR_FORCE_USE_SYSTEM_CURL=ON .
}

build() {
	cd "$srcdir/cpr-$pkgver"
	make
}

package() {
	cd "$srcdir/cpr-$pkgver"

	mkdir -p "$pkgdir/usr/lib"
	cp -r lib/libcpr* "$pkgdir/usr/lib"

	mkdir -p "$pkgdir/usr/include"
	cp -r include/cpr cpr_generated_includes/cpr "$pkgdir/usr/include"
}
