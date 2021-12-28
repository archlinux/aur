# Maintainer: Sematre <sematre at gmx dot de>
pkgname=picotool
pkgver=1.1.0
pkgrel=1

pkgdesc="Tool for inspecting RP2040 binaries and interacting with RP2040 devices."
arch=('any')
url="https://github.com/raspberrypi/picotool"
license=('BSD-3-Clause')
depends=('gcc-libs' 'libusb')
makedepends=('pico-sdk' 'cmake')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('2ed06b469913c86dea3d1e84d01e27c93853a4ebd65cebbefd2ad2c6d3e97780')

build() {
	if [[ -z "${PICO_SDK_PATH}" ]]; then
		error "Couldn't find pico-sdk! Is it set up?"
		exit 1
	fi

	cd "${srcdir}/${pkgname}-${pkgver}"
	cmake -B build
	make -C build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -Dm755 "build/picotool" -t "${pkgdir}/usr/bin/"
	install -Dm644 "LICENSE.TXT"       "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
