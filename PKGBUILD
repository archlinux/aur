# Submitter: Thomas Fanninger <thomas@fanninger.at>
# Maintainer: Nils Czernia <nils@czserver.de>

pkgname=prometheus-snmp-exporter-bin
pkgver=0.18.0
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
                   '7ec67633af45d2dad4c3e587749daa18b2576a678f0101fc6380b1f0d616a02dafe19630f3dd22cae1860c731f29864286115bac84b5bb8d743a5bae39bd1e2c')
sha512sums_armv5h=('770e94f647bc961af3adcc41998ae2b915680d72d3808858fa26834cdc019ce5b1f27f471fdcf988d5c5ec7074be1d613d728027bbcdb1d726f2e4c59a2150a8'
                   '9cff9f92b9d99941023c22cdfdbf642097eb239001babe3fd4c5c9f05c0d8ec4dbd68d39b04ee32b3f0f1138ed9273a917aaadeb5aa8cc0224eacc4d94b8070a')
sha512sums_armv6h=('770e94f647bc961af3adcc41998ae2b915680d72d3808858fa26834cdc019ce5b1f27f471fdcf988d5c5ec7074be1d613d728027bbcdb1d726f2e4c59a2150a8'
                   'a708d5d37345e6cfe108fd9779671a4d67d4df599e96f5545bfc263b50461870c7359684c77d950c3becc4a736af45a25ad57588ffa26a845993aec44f138672')
sha512sums_armv7h=('770e94f647bc961af3adcc41998ae2b915680d72d3808858fa26834cdc019ce5b1f27f471fdcf988d5c5ec7074be1d613d728027bbcdb1d726f2e4c59a2150a8'
                   '3f25f6e6b53b67d0c5423a570dc7d4c130cde444cafa87905044680a0f7214b417d690f45a2d6642fd27107a998444eadfdc0fda4cecf043c552bf7f581b0033')

package() {
    cd "${srcdir}/snmp_exporter-${pkgver}.linux-amd64"

    # Install Binary
    install -D -m0755 snmp_exporter "${pkgdir}/usr/bin/prometheus_snmp_exporter"

    # Install SystemD Service File
    install -D -m0644 "${srcdir}/prometheus-snmp-exporter.service" "${pkgdir}/usr/lib/systemd/system/prometheus-snmp-exporter.service"

    # Install snmp.yml
    install -D -m644 snmp.yml "${pkgdir}/etc/prometheus/snmp.yml"
}
