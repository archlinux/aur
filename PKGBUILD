# Contributor: Chris Gregory <czipperz@gmail.com>

pkgname=libclipboard-git
_pkg="${pkgname%-git}"
pkgver=1.1.r0.g3d2cb08
pkgrel=1
pkgdesc="Lightweight cross-platform C clipboard library"
url="https://github.com/jtanx/libclipboard"
arch=("x86_64")
license=("MIT")
depends=("libxcb")
makedepends=("cmake" "git")
provides=("$_pkg")
conflicts=("$_pkg")
source=("$_pkg::git+$url")
sha256sums=("SKIP")

pkgver() {
	git -C "$_pkg" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
	cmake \
		-B build \
		-S "$_pkg" \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DLIBCLIPBOARD_ADD_SOVERSION=ON \
		-DBUILD_SHARED_LIBS=ON \
		-Wno-dev
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
