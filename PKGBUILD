# Maintainer: Lukas Hertel <dev@lukas-hertel.de>
# Maintainer: Quentin Michaud <mh4ckt3mh4ckt1c4s@archlinux.org>
pkgname=iwasm
pkgver=2.4.5
pkgrel=1
pkgdesc="Executable binary built with WAMR VMCore, supporting WASI and CLI"
arch=('x86_64')
url="https://github.com/bytecodealliance/wasm-micro-runtime"
license=('Apache-2.0')
makedepends=('cmake' 'git')
options=(!strip)
source=(https://github.com/bytecodealliance/wasm-micro-runtime/archive/refs/tags/WAMR-$pkgver.tar.gz)
b2sums=('2f1d53dff6afecfd00f4b782cce20e2ad88d9b81fe7875b10857feaf5efaae83c5a37f4da1edaa7e992fc33a8b1fc1f182d0d8eeb6c059456df2133a8209f54c')

build() {
	cd wasm-micro-runtime-WAMR-$pkgver/product-mini/platforms/linux/
    mkdir build && cd build
    cmake -DCMAKE_INSTALL_PREFIX=$pkgdir/usr -DWAMR_BUILD_DEBUG_INTERP=1 ..
	make
}

package() {
	cd wasm-micro-runtime-WAMR-$pkgver/product-mini/platforms/linux/build
	make install
}
