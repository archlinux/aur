# Maintainer: Guilhem Saurel <saurel@laas.fr>

_org='vsg-dev'
_pkgname=VulkanSceneGraph
pkgname=vulkanscenegraph
pkgver=1.1.4
pkgrel=1
pkgdesc="Vulkan & C++17 based Scene Graph Project"
arch=('i686' 'x86_64')
url="https://github.com/$_org/$_pkgname"
license=('MIT')
depends=('glibc' 'gcc-libs' 'libxcb' 'vulkan-icd-loader')
makedepends=('cmake' 'vulkan-headers')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fd64a19f8b831df5ca2ba1e8785dd9936e0f6b61693952dc4446567640a15191')

build() {
    cmake -B "build-$pkgver" -S "$_pkgname-$pkgver" \
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    cmake --build "build-$pkgver"
}

package() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    install -Dm644 "$_pkgname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
