# Maintainer: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: HUANG Wei <grubbyfans at gmail dot com>

pkgname=influxdb-bin
pkgver=1.8.4
pkgrel=1
pkgdesc="An open source agent for collecting metrics and data on the system; Binary release"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/influxdata/influxdb"
license=('MIT')
depends=("glibc")
conflicts=('influxdb')
backup=('etc/influxdb/influxdb.conf')
install=influxdb.install

source_i686=(influxdb.tar.gz::"https://dl.influxdata.com/influxdb/releases/influxdb-${pkgver}_linux_i386.tar.gz")
sha256sums_i686=('386e9d5e3dbc1fe0f6a9e6b3957b74567670f5a92b6b3569dd13f7b9b7e62aef')
source_x86_64=(influxdb.tar.gz::"https://dl.influxdata.com/influxdb/releases/influxdb-${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('10c80dbec52e0c25de90044b1455f19720cfbc3bf2e9d0dd206a9333bbeb76a7')
source_armv6h=(influxdb.tar.gz::"https://dl.influxdata.com/influxdb/releases/influxdb-${pkgver}_linux_armhf.tar.gz")
sha256sums_armv6h=('cce5096bf5812d40e92353bc077359155ddffb9f3bab33ccc1ed82699cf75e73')
source_armv7h=(influxdb.tar.gz::"https://dl.influxdata.com/influxdb/releases/influxdb-${pkgver}_linux_armhf.tar.gz")
sha256sums_armv7h=('cce5096bf5812d40e92353bc077359155ddffb9f3bab33ccc1ed82699cf75e73')
source=('influxdb.sysusers' 'influxdb.tmpfiles' 'LICENSE')
sha256sums=('a5ffcdb6db92ed33eccd14a93f1243c18d0d64724de641730af451c99642d6d6' 'e2aa59413a6204737383b86cedefd866d7073f56ace5b89aad38c530cc86e60c' 'bece49bfc61abbb9d0b69bebb47955a44617ada83186c95db5651cd40c0a867a')

package() {
  cd $srcdir/influxdb-$pkgver-$pkgrel
  install -Dm644 ../influxdb.sysusers "$pkgdir/usr/lib/sysusers.d/influxdb.conf"
  install -Dm644 ../influxdb.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/influxdb.conf"
  install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/influxdb-bin/LICENSE"

  install -Dm755 usr/bin/influxd "$pkgdir/usr/bin/influxd"
  install -Dm755 usr/bin/influx "$pkgdir/usr/bin/influx"
  install -Dm644 usr/lib/influxdb/scripts/influxdb.service "$pkgdir/usr/lib/systemd/system/influxdb.service"
  install -Dm644 etc/influxdb/influxdb.conf "$pkgdir/etc/influxdb/influxdb.conf"
  install -Dm644 etc/logrotate.d/influxdb "$pkgdir/etc/logrotate.d/influxdb"
}
