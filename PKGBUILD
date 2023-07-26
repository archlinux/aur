# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: UnicornDarkness (AUR user)
# PKGBUILD based on original AUR/cpu-x: https://aur.archlinux.org/packages/cpu-x

_realname=CPU-X
_basename=cpu-x
pkgname="${_basename}-opencl"
pkgver=4.5.3
pkgrel=2.1
pkgdesc='Gathers information on CPU, motherboard, GPU and more (with OpenCL support)'
arch=('i686' 'x86_64')
url="https://thetumultuousunicornofdarkness.github.io/CPU-X"
license=('GPL3')
depends=('gtk3' 'ncurses' 'libcpuid>=0.6.0' 'pciutils' 'glfw' 'opencl-icd-loader' 'vulkan-icd-loader' 'procps-ng>=4.0.0')
makedepends=('cmake' 'ninja' 'nasm' 'opencl-headers' 'vulkan-headers')
checkdepends=('mawk' 'nawk')
optdepends=('opencl-driver: packaged openCL driver'
            'opengl-driver: packaged openGL driver'
            'vulkan-driver: packaged Vulkan driver')
provides=("${_basename}=${pkgver}")
conflicts=("${_basename}")
_tarname="${_basename}-${pkgver}"
source=("${_tarname}.tar.gz::https://github.com/TheTumultuousUnicornOfDarkness/CPU-X/archive/v$pkgver.tar.gz")
sha512sums=('3f3e4f1d31e4e84bdeb68e448a1dabd2e22965caed1668300945a1d9150f77422b685a7a0bad997371ba08a3b0ac7fe3eab3aa1d0b485942347a72eb81d21b4f')

build() {
	cmake -S "$_realname-$pkgver" -B build -GNinja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBEXECDIR="lib/cpu-x" \
		-DWITH_OPENCL=ON
	cmake --build build
}

check() {
	ninja -C build test
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
