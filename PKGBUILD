# Submitter: Thomas Fanninger <thomas@fanninger.at>
# Maintainer: Nils Czernia <nils@czserver.de>

pkgname=prometheus-snmp-exporter-bin
pkgver=0.13.0
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
                   '3b0e3098ba8a250845a821d41b014452c22f86aa749a3c511139fc173cfc2cc607c866a308d9ba27eeb199ef3a3f76766b500615abe91025b92b4e657699bce5')
sha512sums_armv5h=('770e94f647bc961af3adcc41998ae2b915680d72d3808858fa26834cdc019ce5b1f27f471fdcf988d5c5ec7074be1d613d728027bbcdb1d726f2e4c59a2150a8'
                   'ca72c14b1cf8b0d22d6b2dc868b7de9a7307855b17568dfac9ed41d867a5ca62a205f6a089b268b8bb63b2f985f511c95f8cd948880571b33bec578502c1de83')
sha512sums_armv6h=('770e94f647bc961af3adcc41998ae2b915680d72d3808858fa26834cdc019ce5b1f27f471fdcf988d5c5ec7074be1d613d728027bbcdb1d726f2e4c59a2150a8'
                   '30c52fa7c112f1ebce1a2d8e7bc3418448f6661d71779ba1fac7893524c5f4376620cbbe7702061d7282700b28b34ed75e5dfa2591f6dc8c48bac713c66be5e0')
sha512sums_armv7h=('770e94f647bc961af3adcc41998ae2b915680d72d3808858fa26834cdc019ce5b1f27f471fdcf988d5c5ec7074be1d613d728027bbcdb1d726f2e4c59a2150a8'
                   '0a214601b4c06016e95749bbe9ed70485c328e5b26ce9b5dc647ef3a18eacf4275e3ed23f5070e69dd1a8202002ccca2d8fff114b4d7afbd227991123a4c2a00')

package() {
    cd "${srcdir}/snmp_exporter-${pkgver}.linux-amd64"

    # Install Binary
    install -D -m0755 snmp_exporter "${pkgdir}/usr/bin/prometheus_snmp_exporter"

    # Install SystemD Service File
    install -D -m0644 "${srcdir}/prometheus-snmp-exporter.service" "${pkgdir}/usr/lib/systemd/system/prometheus-snmp-exporter.service"

    # Install snmp.yml
    install -D -m644 snmp.yml "${pkgdir}/etc/prometheus/snmp.yml"
}
