# Maintainer: Kookies <kookies at tutamail dot com>
# Original PKGBUILD copied from panda3ds-git

_pkgname=Corgi3DS
_executable_name=Corgi3DS
_install_name=corgi3ds

pkgname=corgi3ds-git
pkgver=r191.38d3d38
pkgrel=1
pkgdesc="An LLE dog-themed 3DS emulator"
arch=('x86_64')
url="https://github.com/PSI-Rockin/Corgi3DS"
license=('GPL-3.0-only')

# Corgi3DS Dependencies
depends=(
	glibc
	gcc-libs
	gmp
	qt5-base
)

# Build Dependencies
makedepends=(
	cmake
	qt5-base
	qt5-multimedia
	git
	gmp
)

provides=(corgi3ds)
conflicts=(corgi3ds)
source=(
	"git+https://github.com/PSI-Rockin/Corgi3DS"
	"00-stdint.diff"
)
sha256sums=(
	'SKIP'
	'027ca7bef7a710f84774dee7993c3a0f987a29b58741b897f1f3cd3b3aee1ed5'
)

pkgver() {
	cd $_pkgname
	printf "r%s.%s" \
	"$(git rev-list --count HEAD)" \
	"$(git rev-parse --short HEAD)"
}

prepare() {
	cd $_pkgname
	git apply ../00-stdint.diff
}

build() {
	cd $_pkgname
	mkdir build && cd build
	cmake .. -DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd $_pkgname
	install -vDm 755 "build/$_executable_name" "$pkgdir/usr/bin/$_install_name"
}
