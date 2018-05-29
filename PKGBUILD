# Maintainer: Goutham Veeramachaneni <gouthamve[at]gmail.com>
# Contributor: Slashbunny <demodevil5[at]yahoo>

pkgname=prometheus-node-exporter-bin
pkgver=0.16.0
pkgrel=1
pkgdesc="Prometheus exporter for machine metrics (binary, not built from source)"
arch=('x86_64' 'armv7h')
url="https://github.com/prometheus/node_exporter"
license=('Apache')
depends=()
makedepends=()
provides=('prometheus-node-exporter')
conflicts=('prometheus-node-exporter')
source_x86_64=( 'prometheus-node-exporter.service'
"https://github.com/prometheus/node_exporter/releases/download/v${pkgver}/node_exporter-${pkgver}.linux-amd64.tar.gz")
source_armv7h=( 'prometheus-node-exporter.service'
"https://github.com/prometheus/node_exporter/releases/download/v${pkgver}/node_exporter-${pkgver}.linux-armv7.tar.gz")
sha256sums_x86_64=('df4ef8a34999ac2acedead7a48e67da31e0b65a29e4570d3075cd8ca663cf1d0'
                   'e92a601a5ef4f77cce967266b488a978711dabc527a720bea26505cba426c029')
sha256sums_armv7h=('df4ef8a34999ac2acedead7a48e67da31e0b65a29e4570d3075cd8ca663cf1d0'
                   'b8bf44c025ec2c5210bdda185f8e72b29ccd3eb9be339b8dbf96835d4fc1965d')

package() {
    case "$CARCH" in
            'x86_64') ARCH='amd64';;
            'armv7h') ARCH='armv7';;
    esac
    cd "${srcdir}/node_exporter-${pkgver}.linux-${ARCH}"

    # Install Binary
    install -D -m0755 node_exporter \
        "${pkgdir}/usr/bin/prometheus_node_exporter"

    # Install SystemD Service File
    install -D -m0644 "${srcdir}/prometheus-node-exporter.service" \
        "${pkgdir}/usr/lib/systemd/system/prometheus-node-exporter.service"
}
