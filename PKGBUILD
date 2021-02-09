# Maintainer: Goutham Veeramachaneni <gouthamve[at]gmail.com>
# Contributor: Slashbunny <demodevil5[at]yahoo>

pkgname=prometheus-node-exporter-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Prometheus exporter for machine metrics (binary, not built from source)"
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/prometheus/node_exporter"
license=('Apache')
depends=()
makedepends=()
provides=('prometheus-node-exporter')
conflicts=('prometheus-node-exporter')
source_x86_64=( 'prometheus-node-exporter.service'
"https://github.com/prometheus/node_exporter/releases/download/v${pkgver}/node_exporter-${pkgver}.linux-amd64.tar.gz")
source_armv6h=( 'prometheus-node-exporter.service'
"https://github.com/prometheus/node_exporter/releases/download/v${pkgver}/node_exporter-${pkgver}.linux-armv6.tar.gz")
source_armv7h=( 'prometheus-node-exporter.service'
"https://github.com/prometheus/node_exporter/releases/download/v${pkgver}/node_exporter-${pkgver}.linux-armv7.tar.gz")
source_aarch64=( 'prometheus-node-exporter.service'
"https://github.com/prometheus/node_exporter/releases/download/v${pkgver}/node_exporter-${pkgver}.linux-arm64.tar.gz")
sha256sums_x86_64=('df4ef8a34999ac2acedead7a48e67da31e0b65a29e4570d3075cd8ca663cf1d0'
                   'a894a85c58388b318843a586ca7540c1c772990ac5327e0c02e10db722f55a22')
sha256sums_armv6h=('df4ef8a34999ac2acedead7a48e67da31e0b65a29e4570d3075cd8ca663cf1d0'
                   '9176c9fdfd83e8224501c4456c74fcebaf064dd5a81bf2540d5d9805e330da5c')
sha256sums_armv7h=('df4ef8a34999ac2acedead7a48e67da31e0b65a29e4570d3075cd8ca663cf1d0'
                   'd5af082c50af8b1e0d0fd40044b91af79e1bbbede74fd194b343eab3464a0585')
sha256sums_aarch64=('df4ef8a34999ac2acedead7a48e67da31e0b65a29e4570d3075cd8ca663cf1d0'
                   '6ea84df0dccc1b45dbbde8cf9a9aacac7484dc7fab1fc938db800bdd169b4b37')

package() {
    case "$CARCH" in
            'x86_64') ARCH='amd64';;
            'armv6h') ARCH='armv6';;
            'armv7h') ARCH='armv7';;
            'aarch64') ARCH='arm64';;
    esac
    cd "${srcdir}/node_exporter-${pkgver}.linux-${ARCH}"

    # Install Binary
    install -D -m0755 node_exporter \
        "${pkgdir}/usr/bin/prometheus_node_exporter"

    # Install SystemD Service File
    install -D -m0644 "${srcdir}/prometheus-node-exporter.service" \
        "${pkgdir}/usr/lib/systemd/system/prometheus-node-exporter.service"
}
