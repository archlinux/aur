# Submitter: Thomas Fanninger <thomas@fanninger.at>
# Maintainer: Nils Czernia <nils@czserver.de>

pkgname=prometheus-snmp-exporter-bin
pkgver=0.15.0
pkgrel=1
pkgdesc="SNMP Exporter for Prometheus (binary, not built from source)"
arch=("x86_64" "armv5h" "armv6h" "armv7h")
url="https://github.com/prometheus/snmp_exporter"
license=("Apache")
depends=()
makedepends=()
provides=("prometheus-snmp-exporter")
conflicts=("prometheus-snmp-exporter")
backup=("etc/prometheus/snmp.yml")

source_x86_64=("prometheus-snmp-exporter.service"
               "https://github.com/prometheus/snmp_exporter/releases/download/v${pkgver}/snmp_exporter-${pkgver}.linux-amd64.tar.gz")
source_armv5h=("prometheus-snmp-exporter.service"
               "https://github.com/prometheus/snmp_exporter/releases/download/v${pkgver}/snmp_exporter-${pkgver}.linux-armv5.tar.gz")
source_armv6h=("prometheus-snmp-exporter.service"
               "https://github.com/prometheus/snmp_exporter/releases/download/v${pkgver}/snmp_exporter-${pkgver}.linux-armv6.tar.gz")
source_armv7h=("prometheus-snmp-exporter.service"
               "https://github.com/prometheus/snmp_exporter/releases/download/v${pkgver}/snmp_exporter-${pkgver}.linux-armv7.tar.gz")

sha512sums_x86_64=('770e94f647bc961af3adcc41998ae2b915680d72d3808858fa26834cdc019ce5b1f27f471fdcf988d5c5ec7074be1d613d728027bbcdb1d726f2e4c59a2150a8'
                   '1421f162f99ba0d3b29539bc97b447f43c42df2383b6c3cf89ec257a1d143edea9d91bbd39fa58c97a1a19e1440c1c6071fe44e20c0fb4584f6ec5d8b34ed7bb')
sha512sums_armv5h=('770e94f647bc961af3adcc41998ae2b915680d72d3808858fa26834cdc019ce5b1f27f471fdcf988d5c5ec7074be1d613d728027bbcdb1d726f2e4c59a2150a8'
                   '3ede2a822245d5693c375c7ad89de5cb816e9c49f83e609feb35e292a646d2afa816476b10c50a55c14851f551128d8cbf06cc77beada43243dea291f0f04137')
sha512sums_armv6h=('770e94f647bc961af3adcc41998ae2b915680d72d3808858fa26834cdc019ce5b1f27f471fdcf988d5c5ec7074be1d613d728027bbcdb1d726f2e4c59a2150a8'
                   'f115e907e3ad387b2e0145145bbfb92ecb3155690c518f4f56abb1a4ca33b2756f60b68d14f1aa36496212b3eb9625aa58d5e6de5ff8f834f3c7d96d98d6697a')
sha512sums_armv7h=('770e94f647bc961af3adcc41998ae2b915680d72d3808858fa26834cdc019ce5b1f27f471fdcf988d5c5ec7074be1d613d728027bbcdb1d726f2e4c59a2150a8'
                   'c8f3303a48ef835ec52dd243da71b3a27831b91355f2b5e2f955e4bc88aff62dc4118d23ca28347f02c6c6026bcaa8faa11e64865cd818138f2dbee837050784')
package() {
    cd "${srcdir}/snmp_exporter-${pkgver}.linux-amd64"

    # Install Binary
    install -D -m0755 snmp_exporter "${pkgdir}/usr/bin/prometheus_snmp_exporter"

    # Install SystemD Service File
    install -D -m0644 "${srcdir}/prometheus-snmp-exporter.service" "${pkgdir}/usr/lib/systemd/system/prometheus-snmp-exporter.service"

    # Install snmp.yml
    install -D -m644 snmp.yml "${pkgdir}/etc/prometheus/snmp.yml"
}
