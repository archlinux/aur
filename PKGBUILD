# Maintainer: Nils Czernia <nils@czserver.de>

pkgname=prometheus-push-gateway-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Prometheus push acceptor for ephemeral and batch jobs "
arch=("x86_64" "arm" "armv6h" "armv7h")
url="https://github.com/prometheus/pushgateway"
license=("Apache")
makedepends=()
source=("prometheus-push-gateway.service")
source_x86_64=("https://github.com/prometheus/pushgateway/releases/download/v${pkgver}/pushgateway-${pkgver}.linux-amd64.tar.gz")
source_arm=("https://github.com/prometheus/pushgateway/releases/download/v${pkgver}/pushgateway-${pkgver}.linux-armv5.tar.gz")
source_armv6h=("https://github.com/prometheus/pushgateway/releases/download/v${pkgver}/pushgateway-${pkgver}.linux-armv6.tar.gz")
source_armv7h=("https://github.com/prometheus/pushgateway/releases/download/v${pkgver}/pushgateway-${pkgver}.linux-armv7.tar.gz")
sha256sums=("fe0ec9b3f18f2f35177fdf8dd8bd5ef0cee3189b65051b4239ad2ba1f5e9961c")
sha256sums_x86_64=("902849c94dc275f157899f7fee1b2f23efbd3bbdb6c3a3c42e503f4439f74ed2")
sha256sums_arm=("dbd976ead419b80ff5ac33fa8b766f586c0367160b9e3dc51293f613a8e0e983")
sha256sums_armv6h=("cf41808520e3607b182ad027eba4153ff3b27351461740fdd557a4fc9c590c99")
sha256sums_armv7h=("ff49a6a47efecde2d714ae3732ad115d9c8e36ea171c04b9fbac9573f3c79f49")

package() {
    case "$CARCH" in
        "x86_64") ARCH="amd64";;
        "arm") ARCH="armv5";;
        "armv6h") ARCH="armv6";;
        "armv7h") ARCH="armv7";;
        "aarch64") ARCH="arm64";;
    esac

    install -Dm755 "${srcdir}/pushgateway-${pkgver}.linux-${ARCH}/pushgateway" "${pkgdir}/usr/bin/prometheus-push-gateway"
    install -Dm755 "${srcdir}/prometheus-push-gateway.service" "${pkgdir}/usr/lib/systemd/system/prometheus-push-gateway.service"
}
