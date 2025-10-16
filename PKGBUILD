# Maintainer: User0 <user0thenyancat@proton.me>

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
_commit="dbcefc6a351517dee782cc822488a09c734db89c"
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('98c0b8ba3b4a333231b665215433f46b11cbfce9424eeadc85ebf3a86335f95f')

build() {
	cmake \
		-B build \
		-S "$pkgname-$_commit" \
		-Wno-dev \
		-DCMAKE_BUILD_TYPE=None \
		-DBUILD_SHARED_LIBS=ON \
		-DCMAKE_INSTALL_PREFIX=/usr
	make -C build
}

package() {
	make -C build install DESTDIR="$pkgdir/"
	cd "$pkgname-$_commit"
	install -Dm644 LICENSE NOTICE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
