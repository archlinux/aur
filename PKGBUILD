# Maintainer: rpkak <rpkak@users.noreply.github.com>
pkgname='vulkan-memory-allocator'
pkgver=3.0.1
pkgrel=1
epoch=
pkgdesc="Easy to integrate Vulkan memory allocation library."
arch=('x86_64')
url="https://gpuopen.com/vulkan-memory-allocator/"
license=('MIT')
groups=()
depends=('vulkan-headers')
makedepends=('cmake' 'libvulkan.so')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2a84762b2d10bf540b9dc1802a198aca8ad1f3d795a4ae144212c595696a360c')
validpgpkeys=()

build() {
    cmake -B build -S "VulkanMemoryAllocator-$pkgver" \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "VulkanMemoryAllocator-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
