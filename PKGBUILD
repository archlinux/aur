# Maintainer: Jozef Holly <j2.00ghz@gmail.com>
pkgname=influxdb2-bin
_upstreamver=2.0.0-beta.10
pkgver=${_upstreamver/-/_}
pkgrel=1
pkgdesc="An open source agent for collecting metrics and data on the system; Binary pre-release"
arch=(x86_64 aarch64)
url="https://github.com/influxdata/influxdb"
license=('MIT')
conflicts=(influxdb)

sha256sums=('dd96a189e7411fc1dd644f05bab06192ecc6afa2f2611e7433ec5efeecb4dd5b'
            '4aa6c35d5157115c1add2e80f1a80cf4918bfdb1d5032deb5fffce4f5fa553f7')
sha256sums_x86_64=('3780F2C6A31AFE3161C300D00CAEC8FEFD97B993C73AFBA476F5CEFE205AADB3')
sha256sums_aarch64=('1A827EB5671C7424337E8482892BCDB2940C8A7B758AE37946C6081CB862BD49')
source=('influxdb.sysusers' 'influxdb.service')
source_x86_64=(influxdb.tar.gz::"https://dl.influxdata.com/influxdb/releases/influxdb_${_upstreamver}_linux_amd64.tar.gz")
source_aarch64=(influxdb.tar.gz::"https://dl.influxdata.com/influxdb/releases/influxdb_${_upstreamver}_linux_arm64.tar.gz")

package() {
  if [[ $CARCH == x86_64 ]]; then
    archname=amd64
  else
    archname=arm64
  fi
  
  cd "$srcdir/influxdb_${_upstreamver}_linux_${archname}"
  install -Dm644 ../influxdb.sysusers "$pkgdir/usr/lib/sysusers.d/influxdb.conf"
  #install -Dm644 ../influxdb.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/influxdb.conf"
  install -Dm644 ../influxdb.service "$pkgdir/usr/lib/systemd/system/influxdb.service"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/influxdb2-bin/LICENSE"
  install -Dm755 influxd "$pkgdir/usr/bin/influxd"
  install -Dm755 influx "$pkgdir/usr/bin/influx"
  #install -Dm644 usr/lib/influxdb/scripts/influxdb.service "$pkgdir/usr/lib/systemd/system/influxdb.service"
  #install -Dm644 etc/influxdb/influxdb.conf "$pkgdir/etc/influxdb/influxdb.conf"
  #install -Dm644 etc/logrotate.d/influxdb "$pkgdir/etc/logrotate.d/influxdb"
}
