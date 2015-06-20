pkgname=lib32-simplescreenrecorder-git
pkgver=0.0.0
pkgrel=1
pkgdesc="OpenGL recording of 32-bit applications with SimpleScreenRecorder. (Git version)"
arch=("x86_64")
url="http://www.maartenbaert.be/simplescreenrecorder/"
license=("GPL3")
source=("git+https://github.com/MaartenBaert/ssr.git")
md5sums=("SKIP")
depends=("lib32-libgl" "lib32-glu" "lib32-libx11" "lib32-libxfixes" "lib32-libxext")
makedepends=("git" "gcc-multilib")
conflicts=("lib32-simplescreenrecorder")
provides=("lib32-simplescreenrecorder")
options=("!libtool")
install=lib32-simplescreenrecorder-git.install

pkgver() {
	cd "${srcdir}/ssr"
	# Use the tag of the last commit
	git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}
build() {
	cd "${srcdir}/ssr"
	export CC="gcc -m32"
	export CXX="g++ -m32"
	export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
	./configure --prefix=/usr --libdir=/usr/lib32 --disable-ssrprogram --disable-assert
	make
}
package() {
	cd "${srcdir}/ssr"
	make DESTDIR="${pkgdir}" install
}
