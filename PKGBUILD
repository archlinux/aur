# Maintainer: Gabriel Jensen <gabrielbjensen@icloud.com>
pkgname=zp-git
pkgver=1.0.0_70.3d14a58
pkgrel=1
pkgdesc="Low-level system and algorithmics library."
arch=("any")
url="https://mandelbrot.dk/zp"
makedepends=("git")
makedepends_x86_64=("nasm")
makedepends_i686=("nasm")
provides=("zp")
conflicts=("zp")
source=("git+https://mandelbrot.dk/zp")
license=("MPL2")
sha512sums=("SKIP")
pkgver() {
	cd "${srcdir}/zp"
	printf "%s_%s.%s" "$(git describe --tags --abbrev=0)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" | sed "s/-dev//g"
}
build() {
	cd "${srcdir}/zp"
	make -C"zp" -j$(($(nproc)+0x1))
}
package() {
	cd "${srcdir}/zp"
	make -C"zp" HDRDIR="${pkgdir}/usr/include" LIBDIR="${pkgdir}/usr/lib" shrlib=true install
}

