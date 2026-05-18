# Maintainer: Lukas Spies <lukas_(a|t)_photoqt_org>

pkgname=libsai-git
_pkgname=libsai
pkgver=r313.ecd0762
pkgrel=1
pkgdesc="Library for reading PaintTool Sai image files."
arch=(x86_64)
url="https://github.com/Wunkolo/libsai"
license=(MIT)
makedepends=(git)
source=("git+https://github.com/Wunkolo/libsai"
		"cmake-header-install-fix.patch")
sha256sums=("SKIP"
			"9a1558bd1ac1466124ceb50ddbb523adf1a8dbd78e341e3024ab1f9c942257c2")

pkgver() {
	cd ${_pkgname}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd ${_pkgname}
	patch -p1 < ${srcdir}/cmake-header-install-fix.patch
	mkdir -p build
}

build() {
	cd ${_pkgname}/build
	cmake .. -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=ON -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd ${_pkgname}/build
	make DESTDIR=$pkgdir install
}
