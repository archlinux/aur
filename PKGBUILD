# Maintainer: piernov <piernov@piernov.org>

pkgname=intel-lms
pkgver=2426.0.0.0
pkgrel=1
pkgdesc="Allows applications to access the Intel AMT firmware via the Intel MEI"
arch=('x86_64')
url="https://github.com/intel/lms"
license=('Apache-2.0')
depends=('glib2' 'curl' 'xerces-c' 'libnl' 'libxml2' 'ace' 'intel-metee')
makedepends=('cmake' 'glib2-devel')
source=("lms-${pkgver}.tar.gz::https://github.com/intel/lms/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a4b9e0e1847e721a39150c7c64e87e66e77aec65624b3bff104404c27620aedf')

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
