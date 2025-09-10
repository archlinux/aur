# Maintainer: Lukas Spies <lukas_(a|t)_photoqt_org>

pkgname=libsai-git
_pkgname=libsai
pkgver=r252.6c7e320
pkgrel=1
pkgdesc="Library for reading PaintTool Sai image files."
arch=(x86_64)
url="https://github.com/Wunkolo/libsai"
license=(MIT)
makedepends=(git)
source=("git+https://github.com/Wunkolo/libsai"
		"cmakelists.patch")
sha256sums=("SKIP"
			"e7729bdb304d41a0e4e1f118c7933285fae4a085e634bc071add242002c1ba62")

pkgver() {
	cd ${_pkgname}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd ${_pkgname}
	patch -p0 CMakeLists.txt < $srcdir/cmakelists.patch
	mkdir -p build
}

build() {
	cd ${_pkgname}/build
	cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd ${_pkgname}/build
	make DESTDIR=$pkgdir install
}
