# Maintainer: David Garfias <dgarfiasme at gmail dot com>
pkgname=libaemu
pkgver=0.1.2
pkgrel=4
pkgdesc="This is an utility library for common functions used in the Android Emulator."
arch=("x86_64")
url="https://android.googlesource.com/platform/hardware/google/aemu/"
license=("Apache-2.0")
source=('git+https://android.googlesource.com/platform/hardware/google/aemu#tag=v0.1.2-aemu-release')
sha256sums=('SKIP')
makedepends=(cmake git clang)

prepare() {
	cd $srcdir/aemu
	mkdir build
}

build() {
	cd $srcdir/aemu
    cmake -B build \
       -DCMAKE_C_COMPILER=/usr/bin/clang \
       -DCMAKE_CXX_COMPILER=/usr/bin/clang++ \
       -DCMAKE_INSTALL_PREFIX='/usr' \
       -DAEMU_COMMON_GEN_PKGCONFIG=ON \
       -DAEMU_COMMON_BUILD_CONFIG=gfxstream \
       -DENABLE_VKCEREAL_TESTS=OFF \
       -DBUILD_SHARED_LIBS=ON
    cmake --build build -j
}
package() {
    cd $srcdir/aemu
	DESTDIR="$pkgdir" cmake --install build
}
