pkgname=zp-cpp
pkgver=0.12.1
pkgrel=1
pkgdesc='C++ utility and Vulkan abstraction library'
arch=('x86_64')
url='https://github.com/zacharypepin/zp_cpp'
license=('ZLIB')
depends=('glm' 'glfw' 'vulkan-headers' 'vulkan-icd-loader' 'openssl' 'enet')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/zacharypepin/zp_cpp/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3b08a155f972d706aeccff576976ded545824475aec1ed8ed6cac9798d7c2760')

build() {
    cmake -B build -S "${srcdir}/zp_cpp-${pkgver}/zp_cpp" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DBUILD_TESTS=OFF
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
