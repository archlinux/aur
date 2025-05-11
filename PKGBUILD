# Maintainer: UnicornDarkness

_realname=CPU-X
pkgname=cpu-x-git
pkgver=5.3.0.r17.g8f886d14
pkgrel=1
pkgdesc="A Free software that gathers information on CPU, motherboard and more"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://thetumultuousunicornofdarkness.github.io/CPU-X"
license=('GPL3')
depends=('gtkmm3' 'ncurses' 'libcpuid>=0.8.0' 'pciutils' 'libglvnd' 'vulkan-icd-loader' 'opencl-icd-loader' 'procps-ng>=4.0.0')
makedepends=('git' 'cmake' 'ninja' 'nasm' 'vulkan-headers' 'opencl-headers' 'polkit')
optdepends=('opengl-driver: packaged openGL driver'
            'vulkan-driver: packaged Vulkan driver'
            'opencl-driver: packaged OpenCL driver')
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
