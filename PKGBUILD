# Maintainer: piernov <piernov@piernov.org>

pkgname=intel-lms
pkgver=2322.0.0.0
pkgrel=1
pkgdesc="Allows applications to access the Intel AMT firmware via the Intel MEI"
arch=('x86_64')
url="https://github.com/intel/lms"
license=('Apache-2.0')
depends=('glib2' 'curl' 'xerces-c' 'libnl' 'libxml2' 'ace')
makedepends=('cmake')
source=("lms-${pkgver}.tar.gz::https://github.com/intel/lms/archive/refs/tags/v${pkgver}.tar.gz"
        "https://github.com/intel/lms/commit/f34024b2a5bb5047e5c69caa2b428f5316f6178a.patch"
        "https://github.com/intel/lms/commit/3527c534c0c5ea3577b78c192811f01a6cf9a707.patch")
sha256sums=('7000fe2692c9dec28c8c4b59d99ef569c1ffd51d3776b20c5967fb1d18b0750d'
            'c55bffa3736ffd339993a8900d644576c20a8b6769bae6a44d94fd04366bd58e'
            'c75da1815d0d80da726f3167aa96f7776d6dca827ff691af3809e349ef57cf45')

prepare() {
	cd "lms-$pkgver"
	patch -p1 < "$srcdir"/f34024b2a5bb5047e5c69caa2b428f5316f6178a.patch
	patch -p1 < "$srcdir"/3527c534c0c5ea3577b78c192811f01a6cf9a707.patch
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
