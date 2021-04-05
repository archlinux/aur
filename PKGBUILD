# Maintainer: Howetuft <howetuft@gmail.com>
# Contributor:

pkgname=ospray-git
pkgver=2.5.0
pkgrel=1
pkgdesc="A Ray Tracing Based Rendering Engine for High-Fidelity Visualization"
arch=(x86_64)
url="https://www.ospray.org/"
license=(Apache)
depends=(glfw intel-tbb embree rkcommon-git openvkl openimagedenoise)
makedepends=(cmake ispc)
source=("https://github.com/ospray/OSPRay/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('074bfd83b5a554daf8da8d9b778b6ef1061e54a1688eac13e0bdccf95593883d')
provides=('ospray=2.5.0')
conflicts=(ospray)

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake ../ospray-${pkgver} \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DOSPRAY_MODULE_DENOISER=ON \
        -Wno-dev
    cmake --build .
}

package() {
    cd build
    make DESTDIR="${pkgdir}" install
}
