# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgorg='vsg-dev'
_pkgname=vsgXchange
pkgname=vsgxchange
pkgver=1.1.0
pkgrel=1
pkgdesc="Utility library for converting data+materials to/from VulkanSceneGraph"
arch=('i686' 'x86_64')
url="https://github.com/$pkgorg/$_pkgname"
license=('MIT')
depends=('freetype2' 'glibc' 'gdal' 'assimp' 'curl' 'gcc-libs' 'vulkanscenegraph' 'vulkan-icd-loader' 'openexr')
makedepends=('cmake' 'vulkan-headers' 'libxcb' 'curl')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4daa2f41b81dcf4e4aacc831dc59b53a296d1142ce13e1529343c26ab2bbcd98')

build() {
    cmake -B "build-$pkgver" -S "$_pkgname-$pkgver" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib
    cmake --build "build-$pkgver"
}

package() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    install -Dm644 "$_pkgname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
