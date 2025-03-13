# Maintainer: Bart Libert <bart plus aur at libert dot email>
pkgname=paho-mqtt-cpp
pkgver=1.5.2
pkgrel=1
pkgdesc='Eclipse Paho MQTT C++ client library'
arch=('x86_64')
url='https://github.com/eclipse/paho.mqtt.cpp'
license=('EPL-2.0')
depends=(paho-mqtt-c openssl gcc-libs glibc)
makedepends=(cmake)
conflicts=(${pkgname}-git)
source=("${pkgname}-${pkgver}::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3d8d9bfee614d74fa2e28dc244733c79e4868fa32a2d49af303ec176ccc55bfb')

build() {
    cmake -B build -S "${srcdir}/${pkgname//-/.}-${pkgver}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_INSTALL_LIBDIR='lib' \
        -DPAHO_BUILD_SHARED=True \
        -DPAHO_BUILD_STATIC=False \
        -DPAHO_WITH_SSL=True \
        -Wno-dev
    cmake --build build -v
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
