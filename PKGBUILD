# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=wasm-micro-runtime
pkgver=1.1.2
pkgrel=1
pkgdesc="Standalone WebAssembly (WASM) runtime with small footprint"
arch=('x86_64')
url="https://github.com/bytecodealliance/wasm-micro-runtime"
license=('Apache')
depends=('glibc')
makedepends=('cmake')
provides=('libiwasm.so')
changelog=RELEASE_NOTES.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/WAMR-$pkgver.tar.gz")
sha256sums=('976b928f420040a77e793051e4d742208adf157370b9ad0f5535e126adb31eb0')

build() {
	cmake \
		-B build \
		-S "$pkgname-WAMR-$pkgver/product-mini/platforms/linux" \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev
	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
}
