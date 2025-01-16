# Maintainer: CloverGit <clovergit@hotmail.com>

pkgname=mingw-w64-quazip-qt6
_pkgname=quazip
pkgver=1.4
pkgrel=2
pkgdesc="C++ wrapper for the ZIP/UNZIP C package, Qt6 version (mingw-w64)"
url="https://stachenov.github.io/quazip/"
license=(LGPL)
arch=(any)
depends=(mingw-w64-qt6-base mingw-w64-qt6-5compat)
makedepends=(mingw-w64-cmake)
#options=("!strip" "!buildflags" "staticlibs")
options=("!buildflags")
groups=("mingw-w64-quazip")
source=(https://github.com/stachenov/$_pkgname/archive/v$pkgver/$_pkgname-$pkgver.tar.gz)
sha256sums=("79633fd3a18e2d11a7d5c40c4c79c1786ba0c74b59ad752e8429746fe1781dd6")

#_architectures="i686-w64-mingw32 x86_64-w64-mingw32"
_architectures="x86_64-w64-mingw32"

build() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -B build-qt6-${_arch} -S $_pkgname-$pkgver \
			-DCMAKE_INSTALL_PREFIX=/usr/${_arch} \
			-DQUAZIP_QT_MAJOR_VERSION=6 \
			-DCMAKE_CXX_FLAGS="${CFLAGS} -fPIC"
		#		${_arch}-cmake --build build-qt6-${_arch}
		cd build-qt6-${_arch}
		make
	done
}

package() {
	for _arch in ${_architectures}; do
		DESTDIR="$pkgdir" cmake --install build-qt6-${_arch}
	done
}

# vim: set sw=2 ts=2 et:
