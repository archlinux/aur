# Maintainer: David Garfias <dgarfiasme at gmail dot com>
pkgname=libaemu
pkgver=0.1.2
pkgrel=1
arch=("x86_64")
license=("Apache-2.0")
source=('git+https://android.googlesource.com/platform/hardware/google/aemu#tag=v0.1.2-aemu-release')
sha256sums=('SKIP')
makedepends=(cmake)


prepare() {
	cd $srcdir/aemu
	mkdir build
}

build() {
	cd $srcdir/aemu
    cmake -B build \
       -DCMAKE_INSTALL_PREFIX='/usr' \
       -DAEMU_COMMON_GEN_PKGCONFIG=ON \
       -DAEMU_COMMON_BUILD_CONFIG=gfxstream \
       -DENABLE_VKCEREAL_TESTS=OFF
    cmake --build build -j
}
package() {
    cd $srcdir/aemu
	DESTDIR="$pkgdir" cmake --install build
}
