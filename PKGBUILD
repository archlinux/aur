# Maintainer: Howetuft <howetuft@gmail.com>
# Contributor:

pkgname=ospray-studio
pkgver=0.5.0
pkgrel=1
pkgdesc="A visualization application that leverages Intel OSPRay as its core rendering engine"
arch=(x86_64)
url="https://www.ospray.org/"
license=(Apache)
depends=('glfw' 'ospray-git>=2.4.0' 'openimagedenoise' 'openimageio')
makedepends=(cmake)
source=("https://github.com/ospray/ospray_studio/archive/v${pkgver}.tar.gz")
sha256sums=('ffdc42ff0ad5b0416527bbc3e1e46562d8336a895c60d8397746eacffbf45c0d')
provides=('ospray-studio=0.5.0')

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
