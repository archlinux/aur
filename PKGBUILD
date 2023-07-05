# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgorg='vsg-dev'
_pkgname=VulkanSceneGraph
pkgname=vulkanscenegraph
pkgver=1.0.7
pkgrel=2
pkgdesc="Vulkan & C++17 based Scene Graph Project"
arch=('i686' 'x86_64')
url="https://github.com/$pkgorg/$_pkgname"
license=('MIT')
makedepends=('cmake' 'vulkan-headers' 'vulkan-icd-loader' 'libxcb')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
"$url/commit/b3c2939141affcae2929c2b7821925214781d6fd.patch"
)
sha256sums=('c6a92495c5c267550927a0a980bb56fe6d3b584aa21a76f72461b1c003d4de08'
            'b89c6a312d2879c70ea56fd0e906872a161444635abe5d9fbd2c82efb234c736')

prepare() {
    patch -d "$_pkgname-$pkgver" -p1 -i "$srcdir/b3c2939141affcae2929c2b7821925214781d6fd.patch"
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
