# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Luís Ferreira <contact@lsferreira.net>
_pkgname=vulkan-headers
pkgname=$_pkgname-git
pkgver=1.3.238.r5.gb232cb2
pkgrel=1
pkgdesc="Vulkan header files"
arch=('any')
url="https://github.com/KhronosGroup/Vulkan-Headers"
license=('Apache')
groups=('vulkan-devel')
makedepends=('cmake' 'git')
provides=("$_pkgname=1:$pkgver" "vulkan-hpp=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --match='v*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cmake -S $_pkgname -B build \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev
	cmake --build build
}

package() {
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
}
