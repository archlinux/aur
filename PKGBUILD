# Contributor: Lex Black <autumn-wind@web.de>

_pkgname=opencloud-desktop
pkgname=opencloud-desktop-git
pkgver=3.0.0.r88.g66ca48b
pkgrel=1
pkgdesc='opencloud desktop application - git checkout'
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
             git
             python-sphinx
	         qt6-declarative
             qt6-tools)
conflicts=('opencloud-desktop')
provides=('opencloud-desktop')
source=("${_pkgname}::git+https://github.com/opencloud-eu/desktop.git")
sha256sums=('SKIP')


pkgver() {
	cd ${_pkgname}
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
	cmake \
		-B build \
		-S "$_pkgname" \
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
