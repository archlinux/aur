# Submitter: Thomas Fanninger <thomas@fanninger.at>
# Maintainer: Nils Czernia <nils@czserver.de>

pkgname=prometheus-snmp-exporter-bin
pkgver=0.14.0
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
                   '5ffae81384c94f135f922f8f0f39e3ba79c76344fd33a91c018170cf63d7dcf694b094504dd30652b00e6b838da493db4b68b6de3e2f67eff5c6744d5dfdd8c9')
sha512sums_armv5h=('770e94f647bc961af3adcc41998ae2b915680d72d3808858fa26834cdc019ce5b1f27f471fdcf988d5c5ec7074be1d613d728027bbcdb1d726f2e4c59a2150a8'
                   '31797a81d291ce2df9d040bb2944913ea488a6f4d3b1432b2da220b3fb7839fefd19b48a2f23d94f1cd15b6e0e0c9fd70cc5ad44cda5d0a6e87ab1bc854d5d5f')
sha512sums_armv6h=('770e94f647bc961af3adcc41998ae2b915680d72d3808858fa26834cdc019ce5b1f27f471fdcf988d5c5ec7074be1d613d728027bbcdb1d726f2e4c59a2150a8'
                   '9ebd232891aad70a058472b65b20799347719f42224bb1dcace91c2810d9bbc95ce2dee8179666d92ccaffe767379ab0aa11e638b9c76f8cc1602cafe9fd90fb')
sha512sums_armv7h=('770e94f647bc961af3adcc41998ae2b915680d72d3808858fa26834cdc019ce5b1f27f471fdcf988d5c5ec7074be1d613d728027bbcdb1d726f2e4c59a2150a8'
                   'ff086a30d7b0a841bd8ffc4e05ab3e6ab4e0e7d7b37cc403a9d3e876bc7f690bd4148df80bfd33a1525c30b8566d22e58e5e97396c316b63bfba8331fe13c8a6')

package() {
    cd "${srcdir}/snmp_exporter-${pkgver}.linux-amd64"

    # Install Binary
    install -D -m0755 snmp_exporter "${pkgdir}/usr/bin/prometheus_snmp_exporter"

    # Install SystemD Service File
    install -D -m0644 "${srcdir}/prometheus-snmp-exporter.service" "${pkgdir}/usr/lib/systemd/system/prometheus-snmp-exporter.service"

    # Install snmp.yml
    install -D -m644 snmp.yml "${pkgdir}/etc/prometheus/snmp.yml"
}
