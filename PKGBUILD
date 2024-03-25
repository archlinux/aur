# Maintainer: Guilhem Saurel <saurel@laas.fr>

_org='vsg-dev'
_pkgname=vsgXchange
pkgname=vsgxchange
pkgver=1.1.1
pkgrel=1
pkgdesc="Utility library for converting data+materials to/from VulkanSceneGraph"
arch=('i686' 'x86_64')
url="https://github.com/$_org/$_pkgname"
license=('MIT')
depends=('freetype2' 'glibc' 'gdal' 'assimp' 'gcc-libs' 'vulkanscenegraph' 'vulkan-icd-loader' 'openexr')
makedepends=('cmake' 'vulkan-headers' 'libxcb' 'curl')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('44935f063eccfd59fd122eff6e8d1683ab2795c49bfc51012fa5db4c31013d2e')

build() {
    cmake -B "build-$pkgver" -S "$_pkgname-$pkgver" \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    cmake --build "build-$pkgver"
}

package() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    install -Dm644 "$_pkgname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
