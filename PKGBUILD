# Maintainer: Florian Hülsmann <fh@cbix.de>

pkgname=cadet-core
pkgver=5.0.3
pkgrel=3
pkgdesc='Modeling and simulation framework for biotechnology processes – simulation backend'
arch=(aarch64 x86_64)
url='https://github.com/cadet/cadet-core'
license=(GPL-3.0-only)
depends=(blas gcc-libs glibc hdf5 lapack suitesparse)
makedepends=(cmake eigen git)
provides=(libcadet.so)
source=("git+https://github.com/cadet/$pkgname#tag=v$pkgver")
sha256sums=('19e8e2da426a95f12212b6e6a11e89a33cea9592d9adccccd08ec8f5e4f142a1')

build() {
	cmake -B build-$pkgname \
		-S $pkgname \
		-DENABLE_TESTS=On \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev

	cmake --build build-$pkgname
}

check() {
	ctest --test-dir build-$pkgname
}

package() {
	DESTDIR="$pkgdir" cmake --install build-$pkgname
}
