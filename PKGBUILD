# Maintainer: Howetuft <howetuft@gmail.com>
# Contributor:

pkgname=ospray-studio
pkgver=0.11.0
pkgrel=1
pkgdesc="A visualization application that leverages Intel OSPRay as its core rendering engine"
arch=(x86_64)
url="https://www.ospray.org/"
license=(Apache)
depends=('glfw' 'ospray' 'openimagedenoise' 'openimageio' 'openexr')
makedepends=(cmake)
source=("https://github.com/ospray/ospray_studio/archive/v${pkgver}.tar.gz")
sha256sums=('fc25d181e8e5d7bf4b2f699652c33fa4dedfbaf38d87d24a0af1f8fccd8b2ed5')
provides=("ospray-studio=0.11.0")

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake ../ospray_studio-${pkgver} \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_BUILD_TYPE=Release \
        -Wno-dev
    cmake --build .
}

package() {
    install -D -m755 build/ospStudio -t "${pkgdir}/usr/bin"
    install -D -m755 build/libospray_sg.so -t "${pkgdir}/usr/lib"
}
