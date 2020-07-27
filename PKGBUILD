# Maintainer: Mitch Bigelow <ipha00@gmail.com>

pkgname=ncnn
pkgver=20200727
pkgrel=1
pkgdesc="High-performance neural network inference framework optimized for the mobile platform"
url="https://github.com/Tencent/ncnn"
license=('BSD')
depends=()
makedepends=('git' 'cmake' 'glslang' 'vulkan-headers' 'vulkan-icd-loader')
conflicts=('ncnn-git')
arch=('i686' 'x86_64')
source=("https://github.com/Tencent/ncnn/archive/${pkgver}.tar.gz")
sha256sums=('8fb664910b44b51bb6a59af101a4245240f670f2d6410209d8a5e3d9b1883944')

build() {
    cd "${srcdir}/ncnn-${pkgver}"
    mkdir -p build
    cd build
    cmake \
        -DCMAKE_TOOLCHAIN_FILE=../toolchains/host.gcc.toolchain.cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DNCNN_BUILD_EXAMPLES=OFF \
        -DNCNN_BUILD_TOOLS=OFF \
        -DNCNN_VULKAN=ON \
        ..
    make
}

package() {
    cd "${srcdir}/ncnn-${pkgver}/build"
    make DESTDIR="${pkgdir}" install
    install -Dm644 "${srcdir}/ncnn-${pkgver}/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
