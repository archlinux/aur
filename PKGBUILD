# Maintainer: piernov <piernov@piernov.org>

pkgname=intel-lms
pkgver=2348.0.0.0
pkgrel=1
pkgdesc="Allows applications to access the Intel AMT firmware via the Intel MEI"
arch=('x86_64')
url="https://github.com/intel/lms"
license=('Apache-2.0')
depends=('glib2' 'curl' 'xerces-c' 'libnl' 'libxml2' 'ace' 'intel-metee')
makedepends=('cmake')
source=("lms-${pkgver}.tar.gz::https://github.com/intel/lms/archive/refs/tags/v${pkgver}.tar.gz"
        "std_c++14.patch")
sha256sums=('e7557d9633966279baf2878cbbd02d36852838873da305e43c07e09efbe2b7dd'
            '4250fe64c90adbabde51eccdb60b9a4018b7f934a46a4e7b0aac97c6f383b88f')

prepare() {
	cd "lms-$pkgver"

	patch -p1 < "$srcdir"/std_c++14.patch
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
