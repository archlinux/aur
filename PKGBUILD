# Maintainer: Lukas Spies <lukas_(a|t)_photoqt_org>

pkgname=libsai-git
_pkgname=libsai
pkgver=r254.df66c16
pkgrel=1
pkgdesc="Library for reading PaintTool Sai image files."
arch=(x86_64)
url="https://github.com/Wunkolo/libsai"
license=(MIT)
makedepends=(git)
source=("git+https://github.com/Wunkolo/libsai")
sha256sums=("SKIP")

pkgver() {
	cd ${_pkgname}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd ${_pkgname}
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
