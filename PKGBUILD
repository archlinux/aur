pkgname=zp-cpp
pkgver=0.12.2
pkgrel=1
pkgdesc='C++ utility and Vulkan abstraction library'
arch=('x86_64')
url='https://github.com/zacharypepin/zp_cpp'
license=('ZLIB')
depends=('glm' 'glfw' 'vulkan-headers' 'vulkan-icd-loader' 'openssl' 'enet')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/zacharypepin/zp_cpp/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('08ae339bb004547461812b9c8839acb9d7d77fdb6aa369f6cf86fc83bf6039df')

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
