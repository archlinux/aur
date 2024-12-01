# Maintainer: UnicornDarkness

_realname=CPU-X
pkgname=cpu-x
pkgver=5.1.1
pkgrel=1
pkgdesc="A Free software that gathers information on CPU, motherboard and more"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://thetumultuousunicornofdarkness.github.io/CPU-X"
license=('GPL3')
depends=('gtkmm3' 'ncurses' 'libcpuid>=0.7.0' 'pciutils' 'glfw' 'vulkan-icd-loader' 'procps-ng>=4.0.0')
makedepends=('cmake' 'ninja' 'nasm' 'vulkan-headers' 'polkit')
optdepends=('opengl-driver: packaged openGL driver'
            'vulkan-driver: packaged Vulkan driver')
source=("$pkgname-$pkgver.tar.gz::https://github.com/TheTumultuousUnicornOfDarkness/CPU-X/archive/v$pkgver.tar.gz")
sha512sums=('8601946feaed567e144350c69761a46a7f5ff1aa47c1d550afca11d6b3eb7546b125c56ecd4f266a33d5ee8a6ef09eba01f7c6570dde25c4f1989971eb6dbb27')

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
