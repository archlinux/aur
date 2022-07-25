# Maintainer: Howetuft <howetuft@gmail.com>
# Contributor:

pkgname=ospray-studio
pkgver=0.11.1
pkgrel=1
pkgdesc="A visualization application that leverages Intel OSPRay as its core rendering engine"
arch=(x86_64)
url="https://www.ospray.org/"
license=(Apache)
depends=('glfw' 'ospray' 'openimagedenoise' 'openimageio' 'openexr')
makedepends=(cmake)
source=("https://github.com/ospray/ospray_studio/archive/v${pkgver}.tar.gz")
sha256sums=('57f2b32763d576bf430146b16969533e1bd58ffbe0b1279f926b3467c1423921')
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
