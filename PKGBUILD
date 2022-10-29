# Maintainer: UnicornDarkness

_realname=CPU-X
pkgname=cpu-x-git
pkgver=4.5.0.r0.gc449fb6
pkgrel=2
pkgdesc="A Free software that gathers information on CPU, motherboard and more"
arch=('i686' 'x86_64')
url="https://thetumultuousunicornofdarkness.github.io/CPU-X"
license=('GPL3')
depends=('gtk3' 'ncurses' 'libcpuid>=0.6.0' 'pciutils' 'glfw' 'opencl-icd-loader' 'vulkan-icd-loader' 'procps-ng')
makedepends=('git' 'cmake' 'ninja' 'nasm' 'opencl-headers' 'vulkan-headers')
checkdepends=('mawk' 'nawk')
optdepends=('opencl-driver: packaged openCL driver'
            'opengl-driver: packaged openGL driver'
            'vulkan-driver: packaged Vulkan driver')
provides=('cpu-x')
conflicts=('cpu-x')
options=('!strip' 'debug')
source=("git+https://github.com/TheTumultuousUnicornOfDarkness/CPU-X.git")
sha512sums=('SKIP')

pkgver() {
	cd "$_realname"
	git describe --long --tags --exclude continuous | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cmake -S "$_realname" -B build -GNinja -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBEXECDIR="lib/cpu-x"
	cmake --build build
}

check() {
	ninja -C build test
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
