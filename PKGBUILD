# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: rpkak <rpkak@users.noreply.github.com>
pkgname=vulkan-memory-allocator
pkgver=3.0.1.r94.g9b0fc3e
pkgrel=1
pkgdesc="Easy to integrate Vulkan memory allocation library"
arch=('any')
url="https://gpuopen.com/vulkan-memory-allocator/"
license=('MIT')
groups=('vulkan-devel')
depends=('vulkan-headers')
makedepends=('cmake' 'git')
_commit=9b0fc3e7b02afe97895eb3e945fe800c3a7485ac
source=("$pkgname::git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
	cd $pkgname
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cmake -S $pkgname -B build \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev
	cmake --build build
}

package() {
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $pkgname/LICENSE.txt
}
