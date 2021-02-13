# Maintainer: Howetuft <howetuft@gmail.com>
# Contributor:

pkgname=ospray-studio
pkgver=0.6.0
pkgrel=1
pkgdesc="A visualization application that leverages Intel OSPRay as its core rendering engine"
arch=(x86_64)
url="https://www.ospray.org/"
license=(Apache)
depends=('glfw' 'ospray-git>=2.5.0' 'openimagedenoise' 'openimageio' 'openexr')
makedepends=(cmake)
source=("https://github.com/ospray/ospray_studio/archive/v${pkgver}.tar.gz")
sha256sums=('3c97c276d09e8c73b0a03356946248e97f39fda4e09abc057a47654492133fe7')
provides=('ospray-studio=0.6.0')

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake ../ospray_studio-${pkgver} \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build .
}

package() {
    cd build
    make DESTDIR="${pkgdir}" install
}
