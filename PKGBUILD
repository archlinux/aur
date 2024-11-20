# Maintainer: Howetuft <howetuft@gmail.com>
# Contributor:

pkgname=ospray-studio
pkgver=1.1.0
pkgrel=0
pkgdesc="A visualization application that leverages Intel OSPRay as its core rendering engine"
arch=(x86_64)
url="https://www.ospray.org/ospray_studio"
license=(Apache)
depends=('glfw' 'ospray' 'openimagedenoise' 'openimageio' 'python' 'intel-oneapi-tbb' 'draco')
makedepends=(cmake)
source=("https://github.com/ospray/ospray_studio/archive/v${pkgver}.tar.gz")
sha256sums=('68309ae22cbc7341b2fafd899ae2e882b7a3732df939e8fd10c5e97232a2fa92')
provides=("ospray-studio=${pkgver}")

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake ../ospray-studio-${pkgver} \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_SKIP_RPATH='YES' \
        -DENABLE_OPENIMAGEIO=ON \
        -DENABLE_GLTF_DRACO=ON \
        -Wno-dev

    cmake --build .
}

package() {
    install -D -m755 build/ospStudio -t "${pkgdir}/usr/bin"
    install -D -m755 build/libospray_sg.so -t "${pkgdir}/usr/lib"
}
