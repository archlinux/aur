# Maintainer: Kookies <kookies at tutamail dot com>
# Original PKGBUILD copied from panda3ds-git

_pkgname=corgi3ds
_executable_name=Corgi3DS
_install_name=corgi3ds

pkgname=corgi3ds-git
pkgver=0.8.r1822.048eca55
pkgrel=1
pkgdesc="An LLE dog-themed 3DS emulator"
arch=('x86_64')
url="https://github.com/PSI-Rockin/Corgi3DS"
license=('GPL3')

# Corgi3DS Dependencies
depends=(
	gcc-libs
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
source=("git+https://github.com/PSI-Rockin/Corgi3DS")
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" \
	"$(git rev-list --count HEAD)" \
	"$(git rev-parse --short HEAD)"
}

build() {
	cd $_pkgname
	mkdir build && cd build
	cmake .. -DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd $_pkgname/build
	install -vDm 755 "build/$_executable_name" "$pkgdir/usr/bin/$_install_name"
}
