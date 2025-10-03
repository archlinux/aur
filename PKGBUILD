# Contributor: Chris Gregory <czipperz@gmail.com>

pkgname=libclipboard-git
_pkg="${pkgname%-git}"
pkgver=r62.e3a5e9c
pkgrel=1
pkgdesc="Lightweight cross-platform C clipboard library"
url="https://github.com/OfficialKris/libclipboard"
arch=("x86_64")
license=("MIT")
depends=("libxcb")
makedepends=("cmake" "git")
provides=("$_pkg")
conflicts=("$_pkg")
source=("git+$url")
sha256sums=("SKIP")
_gitname="libclipboard"

pkgver() {
	cd "${srcdir}/${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
