# Maintainer: Goutham Veeramachaneni <gouthamve[at]gmail.com>
# Contributor: Slashbunny <demodevil5[at]yahoo>

pkgname=prometheus-node-exporter-bin
pkgver=1.0.1
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
                   '3369b76cd2b0ba678b6d618deab320e565c3d93ccb5c2a0d5db51a53857768ae')
sha256sums_armv6h=('df4ef8a34999ac2acedead7a48e67da31e0b65a29e4570d3075cd8ca663cf1d0'
                   'c1d7affbc7762c478c169830c43b4c6177a761bf1d2dd715dbffa55ca772655a')
sha256sums_armv7h=('df4ef8a34999ac2acedead7a48e67da31e0b65a29e4570d3075cd8ca663cf1d0'
                   'e7f4427a25f1870103588e4968c7dc8c1426c00a0c029d0183a9a7afdd61357b')
sha256sums_aarch64=('df4ef8a34999ac2acedead7a48e67da31e0b65a29e4570d3075cd8ca663cf1d0'
                   '017514906922fcc4b7d727655690787faed0562bc7a17aa9f72b0651cb1b47fb')

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
