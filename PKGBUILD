# Maintainer: Rebekah Rowe <rebekahrowe9999@gmail.com>
# Contributor: Rebekah Rowe <rebekahrowe9999@gmail.com>
pkgname=vulkan-memory-allocator-hpp-git
pkgver=3.1.0
pkgrel=1
pkgdesc="C++ bindings for VulkanMemoryAllocator"
arch=('any')
url="https://github.com/YaaZ/VulkanMemoryAllocator-Hpp"
license=('CC0')
depends=('vulkan-memory-allocator-git')
makedepends=('cmake' 'doxygen' 'git')
source=("$pkgname::git+https://github.com/YaaZ/VulkanMemoryAllocator-Hpp#tag=v$pkgver")
sha1sums=('SKIP')

prepare() {
  cd $pkgname
}

build() {
  sed -i 's/VulkanMemoryAllocator::/GPUOpen::/g' $pkgname/CMakeLists.txt

  cmake -B build -S $pkgname \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $pkgname/LICENSE
}
