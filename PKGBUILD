# Maintainer: piernov <piernov@piernov.org>

pkgname=intel-lms
pkgver=2625.0.0.0
pkgrel=1
pkgdesc="Allows applications to access the Intel AMT firmware via the Intel MEI"
arch=('x86_64')
url="https://github.com/intel/lms"
license=('Apache-2.0')
depends=('glib2' 'curl' 'xerces-c' 'libnl' 'libxml2' 'ace' 'intel-metee')
makedepends=('cmake' 'glib2-devel')
source=("lms-${pkgver}.tar.gz::https://github.com/intel/lms/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4607374f0f66e79a7eb6400df7fdd6b5024e2e958ef518d44394f831dcbf7c44')

prepare() {
	cd "lms-$pkgver"
}

build() {
	cd "lms-$pkgver"
	mkdir -p build && cd build
	cmake .. \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "lms-$pkgver"/build
	make DESTDIR="${pkgdir}" install
}
