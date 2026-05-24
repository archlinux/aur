# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=vulkan-low-latency-layer
pkgver=0.2.0
pkgrel=1
pkgdesc='Implicit Vulkan layer that reduces click-to-photon latency for AMD and NVidia.'
url='https://github.com/Korthos-Software/low_latency_layer/'
license=('MIT')
depends=('libstdc++' 'glibc' 'libgcc')
makedepends=('cmake' 'vulkan-headers' 'vulkan-utility-libraries')
arch=('x86_64')
sha256sums=('197cce2253372b663f8319fe479cc95790a55aa20e87cfb5018ca350f5df735a')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")

_srcdir="low_latency_layer-$pkgver"

build() {
	cmake -S "${_srcdir}" -B build \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_CXX_FLAGS_RELEASE='-DNDEBUG' \
		-DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
	install -Dm644 "${srcdir}/${_srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
