# Maintainer: Nils Czernia <nils@czserver.de>

pkgname=prometheus-push-gateway-bin
pkgver=1.0.0
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
sha256sums_x86_64=('5dc6472806ba143b9b6b54f79e5362db3b517acf92e524923fcaf4f184908505')
sha256sums_arm=('c3b3659598c3f5a5a31298b538f269061587db5ca5bb352408e9a1212ec3bbab')
sha256sums_armv6h=('4a30f617c3ef7afd6bc53d38ef476b115092734fbb9d6aa85ad2bc1e5418cba2')
sha256sums_armv7h=('86d8bf2414fac520234260d9bafb0bae8913cbadc17dbaa939636c84ecabe92c')


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
