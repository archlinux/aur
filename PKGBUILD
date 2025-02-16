# Maintainer: Aren Moynihan <rn+aur@peacevolution.org>
pkgname=dem2mesh
pkgver=v1.0.1.r0.725683c
pkgrel=1
pkgdesc="Quickly generate 2.5D meshes from elevation models"
arch=(x86_64)
url="https://github.com/OpenDroneMap/dem2mesh"
license=('GPL-3.0-only')
depends=(gdal glibc gcc-libs)
makedepends=(cmake openmp git)
source=('git+https://github.com/OpenDroneMap/dem2mesh.git#commit=725683c728a19f27ed288d819a2ffe08ea4083f2')
b2sums=('SKIP')

pkgver() {
	cd dem2mesh
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	local cmake_options=(
		-B build
		-S dem2mesh
		-W no-dev
		-D CMAKE_BUILD_TYPE=None
		-D CMAKE_INSTALL_PREFIX=/usr
	)

	cmake "${cmake_options[@]}"
	cmake --build build
}

package() {
	install -Dm 755 build/dem2mesh "$pkgdir/usr/bin/dem2mesh"
}
