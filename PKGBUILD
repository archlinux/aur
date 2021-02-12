# Maintainer: Howetuft <howetuft@gmail.com>
# Contributor:

pkgname=ospray-git
pkgver=2.4.0
pkgrel=1
pkgdesc="A Ray Tracing Based Rendering Engine for High-Fidelity Visualization"
arch=(x86_64)
url="https://www.ospray.org/"
license=(Apache)
depends=(glfw intel-tbb embree rkcommon-git openvkl openimagedenoise)
makedepends=(cmake ispc)
source=("https://github.com/ospray/OSPRay/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('5eaf7409b08147cbeaf087dbf4b3887c15ffeeaa9cfd16dae3ee85504d9014c2')
provides=('ospray=2.4.0')

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
