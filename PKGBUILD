# Maintainer: UnicornDarkness

_realname=CPU-X
pkgname=cpu-x
pkgver=4.5.2
pkgrel=1
pkgdesc="A Free software that gathers information on CPU, motherboard and more"
arch=('i686' 'x86_64')
url="https://thetumultuousunicornofdarkness.github.io/CPU-X"
license=('GPL3')
depends=('gtk3' 'ncurses' 'libcpuid>=0.6.0' 'pciutils' 'glfw' 'opencl-icd-loader' 'vulkan-icd-loader' 'procps-ng')
makedepends=('cmake' 'ninja' 'nasm' 'opencl-headers' 'vulkan-headers')
checkdepends=('mawk' 'nawk')
optdepends=('opencl-driver: packaged openCL driver'
            'opengl-driver: packaged openGL driver'
            'vulkan-driver: packaged Vulkan driver')
source=("$pkgname-$pkgver.tar.gz::https://github.com/TheTumultuousUnicornOfDarkness/CPU-X/archive/v$pkgver.tar.gz")
sha512sums=('a1700293930d7030f5240296f98c40d0e3e7e228678ebb3f87eebaa1939eec9905171ea3716968cad117dc6e4f173ebabe66c5f175b55e45b42b3d373a6f30e5')

build() {
	cmake -S "$_realname-$pkgver" -B build -GNinja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBEXECDIR="lib/cpu-x"
	cmake --build build
}

check() {
	ninja -C build test
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
