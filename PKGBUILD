# Maintainer: Guilhem Saurel <saurel@laas.fr>

_org='vsg-dev'
_pkgname=vsgXchange
pkgname=vsgxchange
pkgver=1.1.4
pkgrel=1
pkgdesc="Utility library for converting data+materials to/from VulkanSceneGraph"
arch=('i686' 'x86_64')
url="https://github.com/$_org/$_pkgname"
license=('MIT')
depends=('freetype2' 'glibc' 'gdal' 'assimp' 'gcc-libs' 'vulkanscenegraph' 'vulkan-icd-loader' 'openexr')
makedepends=('cmake' 'vulkan-headers' 'libxcb' 'curl')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0b79369ddcb3676b6998a6660fcf938314ae34eea9fbababf8471e0b94502597')

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
