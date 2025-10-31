# Maintainer: Your Name <your@email.com>
pkgname=mqtt-console-client
pkgver=1.0.0
pkgrel=1
pkgdesc="Console-based MQTT client in C++ with JSON parsing and wildcards"
arch=('x86_64')
url="https://github.com/liljamartin/mqtt_console_client"
license=('MIT')
depends=('paho-mqtt-cpp' 'nlohmann-json')
makedepends=('cmake' 'gcc' 'git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')  # Replace with real checksum later


build() {
    cd "${srcdir}/mqtt_console_client-${pkgver}"
    rm -rf build CMakeCache.txt CMakeFiles  # remove any possible leftovers
    mkdir -p build
    cd build
    cmake .. -DCMAKE_BUILD_TYPE=Release
    make
}


package() {
    cd "${srcdir}/mqtt_console_client-${pkgver}/build"
    install -Dm755 mqtt_client "$pkgdir/usr/bin/mqtt_client"
    install -Dm644 ../README.md "$pkgdir/usr/share/doc/mqtt_console_client/README.md"    
    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/mqtt_console_client/LICENSE"
}

