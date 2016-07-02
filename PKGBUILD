# Maintainer: Slashbunny <demodevil5[at]yahoo>

pkgname=prometheus-node-exporter-bin
pkgver=0.12.0
pkgrel=1
pkgdesc="Prometheus exporter for machine metrics (binary, not built from source)"
arch=('x86_64')
url="https://github.com/prometheus/node_exporter"
license=('Apache')
depends=()
makedepends=()
provides=('prometheus-node-exporter')
conflicts=('prometheus-node-exporter')
source=( 'prometheus-node-exporter.service'
"https://github.com/prometheus/node_exporter/releases/download/${pkgver}/node_exporter-${pkgver}.linux-amd64.tar.gz")
sha256sums=('df4ef8a34999ac2acedead7a48e67da31e0b65a29e4570d3075cd8ca663cf1d0'
            'd48de5b89dac04aca751177afaa9b0919e5b3d389364d40160babc00d63aac7b')

package() {
    cd "${srcdir}/node_exporter-${pkgver}.linux-amd64"

    # Install Binary
    install -D -m0755 node_exporter \
        "${pkgdir}/usr/bin/prometheus_node_exporter"

    # Install SystemD Service File
    install -D -m0755 "${srcdir}/prometheus-node-exporter.service" \
        "${pkgdir}/usr/lib/systemd/system/prometheus-node-exporter.service"
}
