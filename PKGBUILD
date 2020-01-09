# Maintainer: Michael Migliore <mcmigliore+aur@gmail.com>

pkgname=visrtx
pkgver=0.1.6
pkgrel=1
pkgdesc="Visualization framework powered by NVIDIA technology."
arch=('x86_64')
url="https://github.com/NVIDIA/${pkgname}/tree/v${pkgver}"
license=('custom:NVIDIA')
depends=('cuda' 'optix6' 'mdl-sdk')
makedepends=('cmake')
source=("https://github.com/NVIDIA/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('c99bf2dd2f0e765f35498b5f6a8695ed03dc865452f49aea650862358ffb6d9deb64e729660ce3c849abe15f4f932142cd65d1d84720ac309121d7c751b709bc')

prepare() {
    cd "$srcdir/VisRTX-$pkgver"
}

build() {
    cd "VisRTX-${pkgver}"
    [[ -d build ]] && rm -r build
    mkdir build && cd build
    cmake -DCMAKE_CUDA_COMPILER=/opt/cuda/bin/nvcc \
          -DOptiX_INSTALL_DIR=/opt/optix \
          -DMDL_INSTALL_DIR=/opt/mdl-sdk \
          -DVISRTX_BUILD_SAMPLE=OFF \
          -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr \
          ..
    make
}

package() {
    cd "VisRTX-${pkgver}/build"
    make DESTDIR="${pkgdir}/" install
}
