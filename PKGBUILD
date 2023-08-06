# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgorg='vsg-dev'
_pkgname=vsgXchange
pkgname=vsgxchange
pkgver=1.0.4
pkgrel=1
pkgdesc="Utility library for converting data+materials to/from VulkanSceneGraph"
arch=('i686' 'x86_64')
url="https://github.com/$pkgorg/$_pkgname"
license=('MIT')
makedepends=('cmake' 'vulkan-headers' 'vulkan-icd-loader' 'libxcb' 'vulkanscenegraph' 'freetype2' 'gdal' 'assimp' 'curl')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('12974e520208488ec1d1a0386a7c703e9e69e6b014462737e7f2a83515adb3c7')

build() {
    cmake -B "build-$pkgver" -S "$_pkgname-$pkgver" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib
    cmake --build "build-$pkgver"
}

package() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
}
