# Maintainer: Nils Czernia <nils@czserver.de>

pkgname=prometheus-push-gateway-bin
pkgver=0.8.0
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
sha256sums=('fe0ec9b3f18f2f35177fdf8dd8bd5ef0cee3189b65051b4239ad2ba1f5e9961c')
sha256sums_x86_64=('6949866ba9ad0cb88d3faffd4281f17df79281398b4dbd0ec3aab300071681ca')
sha256sums_arm=('5c3f7037de7c14aa33b86496ce4e52a46a64a09845c0f8376f0d48d1d728ed75')
sha256sums_armv6h=('3c1cadaee2fa556516ef17b460452c2a65d11dd88cdf4937dcf504d6ad66c594')
sha256sums_armv7h=('0cfd42bc74a5fdf1cd083253e76f104e4cb54f28d6ac397d8619313cec8d2a13')

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
