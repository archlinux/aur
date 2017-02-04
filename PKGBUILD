# Maintainer: Thomas Fanninger <thomas@fanninger.at>

pkgname=prometheus-snmp-exporter-bin
pkgver=0.2.0
pkgrel=4
pkgdesc="SNMP Exporter for Prometheus (binary, not built from source)"
arch=('i686' 'x86_64' 'armv5h' 'armv6h' 'armv7h')
url="https://github.com/prometheus/snmp_exporter"
license=('Apache')
depends=()
makedepends=()
provides=('prometheus-snmp-exporter')
conflicts=('prometheus-snmp-exporter')

source_i686=('prometheus-snmp-exporter.service'
             "https://github.com/prometheus/snmp_exporter/releases/download/v${pkgver}/snmp_exporter-${pkgver}.linux-386.tar.gz")
source_x86_64=('prometheus-snmp-exporter.service'
               "https://github.com/prometheus/snmp_exporter/releases/download/v${pkgver}/snmp_exporter-${pkgver}.linux-amd64.tar.gz")
source_armv5h=('prometheus-snmp-exporter.service'
               "https://github.com/prometheus/snmp_exporter/releases/download/v${pkgver}/snmp_exporter-${pkgver}.linux-armv5.tar.gz")
source_armv6h=('prometheus-snmp-exporter.service'
               "https://github.com/prometheus/snmp_exporter/releases/download/v${pkgver}/snmp_exporter-${pkgver}.linux-armv6.tar.gz")
source_armv7h=('prometheus-snmp-exporter.service'
               "https://github.com/prometheus/snmp_exporter/releases/download/v${pkgver}/snmp_exporter-${pkgver}.linux-armv7.tar.gz")

sha512sums_i686=('38eb3feb8cc64b078d119d67d6855bee55dfff89f87c153755961abbafd1a6f729a9cfa9e76da1ab54f63b0c1d1c46775d0368cbb191e3ddde7e9754093ad9ab'
                 '212e1dc23adb661923755571cae741160d31bf48fb6f4cac066929aa6653e5e552f0b6021465a345dc674105ad59c1c86c6e6c9f3193e36ead344f8b0a1682dd')
sha512sums_x86_64=('38eb3feb8cc64b078d119d67d6855bee55dfff89f87c153755961abbafd1a6f729a9cfa9e76da1ab54f63b0c1d1c46775d0368cbb191e3ddde7e9754093ad9ab'
                   '8c437c142fbc5ed77ab910ee79501f9e0775c6d7b16d4ce76a427c6dd34b90eeb2c21794546a52fd34ee69700422352c0b964cb435e3bd9c3b37003b432b38de')
sha512sums_armv5h=('38eb3feb8cc64b078d119d67d6855bee55dfff89f87c153755961abbafd1a6f729a9cfa9e76da1ab54f63b0c1d1c46775d0368cbb191e3ddde7e9754093ad9ab'
                   'a640bc125235f5a387378c043cad4dc369866ff6846a0bf79c861a81edce5adebf708590924a1665622273928577bd6235c7382572b0f5065b996c04d0c0a624')
sha512sums_armv6h=('38eb3feb8cc64b078d119d67d6855bee55dfff89f87c153755961abbafd1a6f729a9cfa9e76da1ab54f63b0c1d1c46775d0368cbb191e3ddde7e9754093ad9ab'
                   '28c5240e2587b09091f60fa5924875c65fccdb1c903e178280c7e3919b1dc851fb4aed9e71fb3199ac088334bd0e7645031b93cb81ea17ebd645455471062437')
sha512sums_armv7h=('38eb3feb8cc64b078d119d67d6855bee55dfff89f87c153755961abbafd1a6f729a9cfa9e76da1ab54f63b0c1d1c46775d0368cbb191e3ddde7e9754093ad9ab'
                   'ad67e3425bd21aad35adf27e2f08307fc05eac08e1b2202593e4b26f6ff50851a36f7de2b452acc4a87d47a1c45f4191a8fb1cd4b8ddb2bc20595d1612d453fe')

package() {
    cd "${srcdir}/snmp_exporter-${pkgver}.linux-amd64"

    # Install Binary
    install -D -m0755 snmp_exporter "${pkgdir}/usr/bin/prometheus_snmp_exporter"

    # Install SystemD Service File
    install -D -m0755 "${srcdir}/prometheus-snmp-exporter.service" "${pkgdir}/usr/lib/systemd/system/prometheus-snmp-exporter.service"

    # Install snmp.yml
    install -D -m644 snmp.yml "${pkgdir}/etc/prometheus/snmp.yml"
}