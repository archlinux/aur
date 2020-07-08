# Maintainer: Maarten Baert <maarten-baert@hotmail.com>

pkgname=lib32-simplescreenrecorder-git
pkgver=0.4.2.r11.g7f26bc7
pkgrel=1
pkgdesc="Record 32-bit OpenGL applications with SimpleScreenRecorder. (Git version)"
arch=("x86_64")
url="https://www.maartenbaert.be/simplescreenrecorder/"
license=("GPL3")
depends=("lib32-libgl" "lib32-glu" "lib32-libx11" "lib32-libxext" "lib32-libxfixes")
makedepends=("git" "gcc-multilib" "cmake")
source=("git+https://github.com/MaartenBaert/ssr.git")
md5sums=("SKIP")
conflicts=("lib32-simplescreenrecorder")
provides=("lib32-simplescreenrecorder")

install=lib32-simplescreenrecorder-git.install

pkgver() {
	cd ssr
	# Use the tag of the last commit
	git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}
prepare() {
	cd ssr
	mkdir -p build
}
build() {
	cd ssr/build
	export CC="gcc -m32"
	export CXX="g++ -m32"
	export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
	cmake -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_INSTALL_LIBDIR="lib32" -DCMAKE_BUILD_TYPE=Release -DWITH_SIMPLESCREENRECORDER=FALSE ..
	make
}
package() {
	cd ssr/build
	make DESTDIR="$pkgdir" install
}
