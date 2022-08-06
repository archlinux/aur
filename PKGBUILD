# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=libuinputplus
pkgver=0.2.1
pkgrel=1
pkgdesc="Easy-to-use uinput library in C++"
url="https://github.com/YukiWorkshop/libuInputPlus"
license=('MIT')
arch=('x86_64')
depends=('gcc-libs')
makedepends=('cmake')
provides=('libuInputPlus.so')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "001-install-directives.patch::$url/commit/0edb383.patch")
sha256sums=('af53e4727068f5f66d03d63beecdb24f44342ce1aa352d4f32c18892fa86e67a'
            '09346612127312f732eb51da2020dd272395bcdd4691f81a3df02f4ca7789dda')

prepare() {
	patch -p1 -d "libuInputPlus-$pkgver" < 001-install-directives.patch
}

build() {
	cmake \
		-B build \
		-S "libuInputPlus-$pkgver" \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_SHARED_LIBS=ON \
		-Wno-dev
	make -C build
}

package() {
	make -C build install DESTDIR="$pkgdir"
	install -Dm644 "libuInputPlus-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
