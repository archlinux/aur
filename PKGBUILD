# Submitter: Thomas Fanninger <thomas@fanninger.at>
# Maintainer: Nils Czernia <nils@czserver.de>

pkgname=prometheus-snmp-exporter-bin
pkgver=0.11.0
pkgrel=2
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
                   '4c60679e2ee65d90f43a706f649ff350778217d5503001a508850b22a334ac4f9e4a80afb0bd2be98185449e15cf2056081a962952c8befbf6786349c2e6cdb0')
sha512sums_armv5h=('770e94f647bc961af3adcc41998ae2b915680d72d3808858fa26834cdc019ce5b1f27f471fdcf988d5c5ec7074be1d613d728027bbcdb1d726f2e4c59a2150a8'
                   'cf85e45343989ae9b3219e54fdece3f4a2505df57a6932903f046553166a35768e183bdfba24979a58d13bfbd212ab8f039930d1459d0278ba060b3fe7214910')
sha512sums_armv6h=('770e94f647bc961af3adcc41998ae2b915680d72d3808858fa26834cdc019ce5b1f27f471fdcf988d5c5ec7074be1d613d728027bbcdb1d726f2e4c59a2150a8'
                   '6f8a6b666870b84e0addd0b64ac02c06a677832ad02b8be8c16427b5754d4e2920dab69324211850bc11bae3161eec5e781c313dd98bdad63269758826ce5174')
sha512sums_armv7h=('770e94f647bc961af3adcc41998ae2b915680d72d3808858fa26834cdc019ce5b1f27f471fdcf988d5c5ec7074be1d613d728027bbcdb1d726f2e4c59a2150a8'
                   '81a101ddd8a13b9926749b0480159283372648b474f5f90d61469d6c03fbeaf5a6672a9a92abf9e6ac76abd5e90bbc3d3ad4fb8d524a81ae241c08bf4332435b')

package() {
    cd "${srcdir}/snmp_exporter-${pkgver}.linux-amd64"

    # Install Binary
    install -D -m0755 snmp_exporter "${pkgdir}/usr/bin/prometheus_snmp_exporter"

    # Install SystemD Service File
    install -D -m0644 "${srcdir}/prometheus-snmp-exporter.service" "${pkgdir}/usr/lib/systemd/system/prometheus-snmp-exporter.service"

    # Install snmp.yml
    install -D -m644 snmp.yml "${pkgdir}/etc/prometheus/snmp.yml"
}
