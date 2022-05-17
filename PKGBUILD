# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=tfblib
pkgver=0.1.1
pkgrel=1
pkgdesc="Low-level graphics library for drawing to the framebuffer"
arch=('x86_64')
url="https://github.com/vvaltchev/tfblib"
license=('BSD')
depends=('glibc')
makedepends=('cmake')
provides=('libtfb.so')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('957cdf360ed247cd0e4ced377ae9a6e7261d60a5216cd1f63e50814d6bdd3c8e')

build() {
	cmake \
		-B build \
		-S "$pkgname-$pkgver" \
		-Wno-dev \
		-DCMAKE_BUILD_TYPE=None \
		-DBUILD_SHARED_LIBS=ON \
		-DCMAKE_INSTALL_PREFIX=/usr
	make -C build
}

package() {
	make -C build install DESTDIR="$pkgdir/"
	cd "$pkgname-$pkgver"
	install -Dm644 LICENSE NOTICE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
