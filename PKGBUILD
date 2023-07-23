# Maintainer: Gabriel Bjørnager Jensen <gabrielbjensen@icloud.com>
pkgname=u8c-git
pkgver=29_30.a48610b
pkgrel=1
pkgdesc="Unicode for C."
arch=("any")
url="https://mandelbrot.dk/u8c"
makedepends=("cmake" "git")
provides=("u8c")
conflicts=("u8c")
source=("git+https://mandelbrot.dk/u8c")
license=("LGPL3")
sha512sums=("SKIP")
pkgver() {
	cd "${srcdir}/u8c"
	printf "%s_%s.%s" "$(git describe --abbrev=0 --tags)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare() {
	cd "${srcdir}/u8c"
	cmake -Bbuild -DCMAKE_BUILD_TYPE=Release
}
build() {
	cd "${srcdir}/u8c"
	cmake --build build
}
package() {
	cd "${srcdir}/u8c"
	mkdir -pm755 "${pkgdir}/usr/include/u8c"
	mkdir -pm755 "${pkgdir}/usr/lib"
	install -m755 "build/u8c/libu8c.so" "${pkgdir}/usr/lib/"
	install -m644 "u8c/include/u8c/"*".h" "${pkgdir}/usr/include/u8c/"
}

