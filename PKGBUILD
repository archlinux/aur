# Maintainer: Dave Ingram <aur[at]dmi.me.uk>

pkgname=iptables-exporter-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Prometheus exporter for iptables metrics (binary, not built from source)"
arch=('x86_64')
url="https://github.com/retailnext/iptables_exporter"
license=('Apache')
depends=()
makedepends=()
provides=('iptables-exporter')
conflicts=('iptables-exporter')
source=( 'iptables-exporter.service' )
source_x86_64=( "$url/releases/download/v${pkgver}/iptables_exporter-${pkgver}.linux-amd64.tar.gz")
md5sums=('7697c3ce8640e1e4c2b077c40bc09571')
md5sums_x86_64=('1ed90b84cd9579b9ac7e8a9737492199')

package() {
    case "$CARCH" in
            'x86_64') ARCH='amd64';;
            'armv6h') ARCH='armv6';;
            'armv7h') ARCH='armv7';;
            'aarch64') ARCH='arm64';;
    esac
    cd "${srcdir}/iptables_exporter-${pkgver}.linux-${ARCH}"

    # Install Binary
    install -D -m0755 iptables_exporter \
        "${pkgdir}/usr/bin/iptables_exporter"

    # Install SystemD Service File
    install -D -m0644 "${srcdir}/iptables-exporter.service" \
        "${pkgdir}/usr/lib/systemd/system/iptables-exporter.service"
}
