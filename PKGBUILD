pkgname=mqtt-console-client
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple console-based MQTT client"
arch=('x86_64')
url="https://github.com/liljamartin/mqtt_console_client"
license=('MIT')
depends=('openssl' 'paho-mqtt-c')
makedepends=('cmake' 'make' 'gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/liljamartin/mqtt_console_client/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/mqtt_console_client-${pkgver}"
    cmake -B build -S . -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    cd "${srcdir}/mqtt_console_client-${pkgver}/build"
    install -Dm755 mqtt_client "$pkgdir/usr/bin/mqtt_client"

    install -Dm644 "${srcdir}/mqtt_console_client-${pkgver}/README.md" \
        "$pkgdir/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "${srcdir}/mqtt_console_client-${pkgver}/LICENSE" \
        "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
