# Contributor: Lex Black <autumn-wind@web.de>

pkgname=opencloud-desktop
pkgver=3.0.3
pkgrel=2
pkgdesc='opencloud desktop application'
arch=('x86_64')
url="https://github.com/opencloud-eu/desktop"
license=('GPL-2.0-only')
depends=(glibc
         kdsingleapplication
         libre-graph-api
         libstdc++
         qt6-base
         qtkeychain-qt6
         sqlite
         zlib)
makedepends=(doxygen
             extra-cmake-modules
             python-sphinx
	         qt6-declarative
             qt6-tools)
source=("${pkgname}-${pkgver/_/-}.tar.gz::https://github.com/opencloud-eu/desktop/archive/refs/tags/v${pkgver/_/-}.tar.gz")
sha256sums=('2f4f9e047de28b796a9994375e83450d41d3c4d79d4797093c6e1d41e1ee619e')


build() {
	cmake \
		-B build \
		-S "desktop-${pkgver/_/-}" \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_SKIP_INSTALL_RPATH=ON \
		-DBUILD_TESTING=OFF \
		-DKDE_INSTALL_SYSCONFDIR=/etc
	make -C build
}

package() {
	make DESTDIR="${pkgdir}/" -C build install
}
