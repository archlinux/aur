# Maintainer: Mathieu Clabaut <mathieu[at]clabaut.net>

pkgname=prometheus-blackbox-exporter-bin
pkgver=0.12.0
pkgrel=2
pkgdesc="Prometheus blackbox exporter allows blackbox probing of endpoints over HTTP, HTTPS, DNS, TCP and ICMP (binary, not built from source)."
arch=('x86_64')
url="https://github.com/prometheus/blackbox_exporter"
license=('Apache')
depends=()
makedepends=()
provides=('prometheus-blackbox-exporter')
conflicts=('prometheus-blackbox-exporter')
source=( 'prometheus-blackbox-exporter.service' 'config.yml'
"https://github.com/prometheus/blackbox_exporter/releases/download/v${pkgver}/blackbox_exporter-${pkgver}.linux-amd64.tar.gz")
sha256sums=('aba10388d5f6f3fc36779c3a9c329308b147fcd35751ff6542e7f9744071930e'
            '38d9cf33beabc7bcf2a2504c2657ecee66a96da94a4f829619e92980800da3ce'
            'c5d8ba7d91101524fa7c3f5e17256d467d44d5e1d243e251fd795e0ab4a83605')

package() {
    cd "${srcdir}/blackbox_exporter-${pkgver}.linux-amd64"

    # Install Binary
    install -D -m0755 blackbox_exporter \
        "${pkgdir}/usr/bin/prometheus_blackbox_exporter"

    # Install SystemD Service File
    install -D -m0644 "${srcdir}/prometheus-blackbox-exporter.service" \
        "${pkgdir}/usr/lib/systemd/system/prometheus-blackbox-exporter.service"
    #Install example configuration
    install -D -m0644 "${srcdir}/config.yml" \
        "${pkgdir}/etc/prometheus/blackbox.yml"
}
