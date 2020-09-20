# Maintainer: Mitch Bigelow <ipha00@gmail.com>

pkgname=ncnn
pkgver=20200916
pkgrel=1
pkgdesc="High-performance neural network inference framework optimized for the mobile platform"
url="https://github.com/Tencent/ncnn"
license=('BSD')
depends=()
makedepends=('git' 'cmake' 'glslang' 'vulkan-headers' 'vulkan-icd-loader')
conflicts=('ncnn-git')
arch=('i686' 'x86_64')
source=("https://github.com/Tencent/ncnn/archive/${pkgver}.tar.gz")
sha256sums=('a7abc03c9acdaa1b4f85ce3f80722822f9eacc0efefc9dfef1e253fdb23d0f80')

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
