# Maintainer: piernov <piernov@piernov.org>

pkgname=intel-lms
pkgver=2406.0.0.0
pkgrel=1
pkgdesc="Allows applications to access the Intel AMT firmware via the Intel MEI"
arch=('x86_64')
url="https://github.com/intel/lms"
license=('Apache-2.0')
depends=('glib2' 'curl' 'xerces-c' 'libnl' 'libxml2' 'ace' 'intel-metee')
makedepends=('cmake')
source=("lms-${pkgver}.tar.gz::https://github.com/intel/lms/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3ca0411f243a4056c0514a13c7af5d6b508c49f3e22eb7505ac46d070f1c49b6')

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
