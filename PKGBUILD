# Maintainer: wypifu <lilington80@gmail.com> <lilington@mail.ru>
pkgname=blukpast
pkgver=1.0.6
pkgrel=1
pkgdesc="Lightweight Vulkan graphics library in C — pipelines, descriptors, buffers, textures, GLTF/OBJ/PLY/STL loaders"
arch=('x86_64')
url="https://github.com/wypifu/blukpast"
license=('LGPL2.1')
depends=('vulkan-icd-loader' 'glfw')
makedepends=('cmake' 'ninja' 'shaderc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wypifu/blukpast/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8bfdf2017fd4f2e0e5e5002613bf9f14c07fba8e01ab879ae42628ed9e0e1368')

build() {
    cd "${pkgname}-${pkgver}"
    mkdir -p build
    cd build
    cmake .. \
        -DBUILD_TUTORIALS=OFF \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -G Ninja
    ninja
}

package() {
    cd "${pkgname}-${pkgver}/build"
    DESTDIR="${pkgdir}" ninja install
}
