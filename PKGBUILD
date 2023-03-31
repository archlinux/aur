# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=rapidobj
pkgver=1.0.1
pkgrel=1
epoch=
pkgdesc="A fast, header-only, C++17 library for parsing Wavefront .obj files."
arch=('any')
url="https://github.com/guybrush77/rapidobj"
license=('MIT')
groups=()
depends=()
makedepends=('cmake')
checkdepends=()
optdepends=()
provides=()
conflicts=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('73eca15cdc583e1f770f51d694b856c5acafd80db521df5e63d95bb17f418114')

prepare() {
	cd "$pkgname-$pkgver"

	mkdir -p build
}

build() {
	cd "$pkgname-$pkgver/build"

	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		..
	make
}

package() {
	cd "$pkgname-$pkgver/build"

	make DESTDIR="$pkgdir/" install

	install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
