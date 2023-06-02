# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgorg='vsg-dev'
_pkgname=vsgXchange
pkgname=vsgxchange
pkgver=1.0.3
pkgrel=1
pkgdesc="Utility library for converting data+materials to/from VulkanSceneGraph"
arch=('i686' 'x86_64')
url="https://github.com/$pkgorg/$_pkgname"
license=('MIT')
makedepends=('cmake' 'vulkan-headers' 'vulkan-icd-loader' 'libxcb' 'vulkanscenegraph' 'freetype2' 'gdal' 'assimp' 'curl')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz" "$url/pull/150.patch")
sha256sums=('dc540f56cd92fcd3d1ada424063a971587414d9b8e43907097c758a785b222a5'
            '8b14d4c16cd752503334ca8f77c21550d9e28db419b2011f0c019f20bf233334')

prepare() {
    patch -d "$_pkgname-$pkgver" -p1 -i "$srcdir/150.patch"
}

build() {
    cmake -B "build-$pkgver" -S "$_pkgname-$pkgver" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib
    cmake --build "build-$pkgver"
}

package() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
}
