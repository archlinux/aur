# Maintainer: Howetuft <howetuft@gmail.com>
# Contributor:

pkgname=ospray-studio
pkgver=0.13.0
pkgrel=1
pkgdesc="A visualization application that leverages Intel OSPRay as its core rendering engine"
arch=(x86_64)
url="https://www.ospray.org/"
license=(Apache)
depends=('glfw' 'ospray' 'openimagedenoise' 'openimageio' 'python' 'intel-oneapi-tbb' 'draco')
makedepends=(cmake)
source=("https://github.com/ospray/ospray_studio/archive/v${pkgver}.tar.gz")
sha256sums=('699c9f93b0ef325d16233c871da3d52758f26a8091d2bce1d4b8f2eaf9b6afe4')
provides=("ospray-studio=0.13.0")

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake ../ospray_studio-${pkgver} \
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
