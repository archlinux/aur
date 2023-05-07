# Maintainer: Gabriel Jensen <gabrielbjensen@icloud.com>
pkgname=agbsum-git
pkgver=7
pkgrel=1
pkgdesc="GBA ROM header checksum patcher."
arch=("any")
url="https://mandelbrot.dk/agbsum"
makedepends=("cmake" "git")
provides=("agbsum")
conflicts=("agbsum")
source=("git+https://mandelbrot.dk/agbsum")
license=("AGPL3")
sha512sums=("SKIP")
pkgver() {
	cd "${srcdir}/agbsum"
	printf "%s" "$(git describe --abbrev=0)"
}
build() {
	cd "${srcdir}/agbsum"
	cmake -Bbuild -DCMAKE_BUILD_TYPE=Release
	cmake --build build
}
package() {
	cd "${srcdir}/agbsum"
	mkdir -pm755 "${pkgdir}/usr/bin"
	install -m755 "build/agbsum/agbsum" "${pkgdir}/usr/bin"
}

