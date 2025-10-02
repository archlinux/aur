pkgname=zp-cpp
pkgver=0.12.2
pkgrel=1
pkgdesc='C++ utility and Vulkan abstraction library'
arch=('x86_64')
url='https://github.com/zacharypepin/zp_cpp'
license=('ZLIB')
depends=('glm' 'glfw' 'vulkan-headers' 'vulkan-icd-loader' 'openssl' 'enet')
makedepends=('cmake' 'ninja')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/zacharypepin/zp_cpp/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('08ae339bb004547461812b9c8839acb9d7d77fdb6aa369f6cf86fc83bf6039df')

build() {
    local sourcedir="${srcdir}/zp_cpp-${pkgver}/zp_cpp"
    local builddir="${srcdir}/build"

    cmake \
        -S "${sourcedir}" \
        -B "${builddir}" \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_TESTS=OFF

    cmake --build "${builddir}"
}

package() {
    local builddir="${srcdir}/build"
    DESTDIR="${pkgdir}" cmake --install "${builddir}"
}
