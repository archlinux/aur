# Maintainer: Bart Libert <bart plus aur at libert dot email>
pkgname=paho-mqtt-cpp
pkgver=1.3.2
pkgrel=1
pkgdesc='Eclipse Paho MQTT C++ client library'
arch=('x86_64')
url='https://github.com/eclipse/paho.mqtt.cpp'
license=('EPL-2.0')
depends=(paho-mqtt-c openssl gcc-libs glibc)
makedepends=(cmake)
conflicts=(${pkgname}-git)
source=("${pkgname}-${pkgver}::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c271d521287f417102b447b3d1e8d17be0e0f6a3b0b653334ebcd2ccd20d1e46')

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
