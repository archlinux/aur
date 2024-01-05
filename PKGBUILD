# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgorg='vsg-dev'
_pkgname=VulkanSceneGraph
pkgname=vulkanscenegraph
pkgver=1.1.0
pkgrel=1
pkgdesc="Vulkan & C++17 based Scene Graph Project"
arch=('i686' 'x86_64')
url="https://github.com/$pkgorg/$_pkgname"
license=('MIT')
depends=('glibc' 'gcc-libs' 'libxcb' 'vulkan-icd-loader')
makedepends=('cmake' 'vulkan-headers')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ec5e1db9ec4082598b6d56fb5812fdf552e5a6b49792cb80f29bcb8a23fe7cac')

build() {
    cmake -B "build-$pkgver" -S "$_pkgname-$pkgver" \
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib
    cmake --build "build-$pkgver"
}

package() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    install -Dm644 "$_pkgname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
