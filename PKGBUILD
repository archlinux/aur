# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=wasm-micro-runtime
pkgver=1.1.1
pkgrel=1
pkgdesc="Standalone WebAssembly (WASM) runtime with small footprint"
arch=('x86_64')
url="https://github.com/bytecodealliance/wasm-micro-runtime"
license=('Apache')
depends=('glibc')
makedepends=('cmake')
provides=('libiwasm.so')
source=("$pkgname-$pkgver.tar.gz::$url/archive/WAMR-$pkgver.tar.gz")
sha256sums=('3bf621401e6f97f81c357ad019d17bdab8f3478b9b3adf1cfe8a4f243aef1769')

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
