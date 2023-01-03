# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgorg='vsg-dev'
_pkgname=vsgXchange
pkgname=vsgxchange
pkgver=1.0.1
pkgrel=1
pkgdesc="Utility library for converting data+materials to/from VulkanSceneGraph"
arch=('i686' 'x86_64')
url="https://github.com/$pkgorg/$_pkgname"
license=('MIT')
makedepends=('cmake' 'vulkan-headers' 'vulkan-icd-loader' 'libxcb' 'vulkanscenegraph' 'freetype2' 'gdal' 'assimp' 'curl')
source=("$url/archive/refs/tags/$_pkgname-$pkgver.tar.gz")
sha256sums=('e28ad35556b609d839a2603afba0f960cb52a395b5c81ffa8ab7654bb78f3cab')

build() {
    cmake -B "build-$pkgver" -S "$_pkgname-$_pkgname-$pkgver" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib
    cmake --build "build-$pkgver"
}

package() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
}
