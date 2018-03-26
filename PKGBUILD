# Maintainer: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: HUANG Wei <grubbyfans at gmail dot com>

pkgname=influxdb-bin
pkgver=1.5.1
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
sha256sums_i686=('62b980d1c3449709f3ae9e80ec54410a90193ac26762b19dbb438dba7da39d52')
source_x86_64=(influxdb.tar.gz::"https://dl.influxdata.com/influxdb/releases/influxdb-${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('79d924a0846146f08c608cdb05715d44d374cc7e6ade701992cb6f83d8b37088')
source_armv6h=(influxdb.tar.gz::"https://dl.influxdata.com/influxdb/releases/influxdb-${pkgver}_linux_armhf.tar.gz")
sha256sums_armv6h=('8ecb41296333411a6fb7e47f4b4ac817564af9e4b72f0206b21f619b81af9850')
source_armv7h=(influxdb.tar.gz::"https://dl.influxdata.com/influxdb/releases/influxdb-${pkgver}_linux_armhf.tar.gz")
sha256sums_armv7h=('8ecb41296333411a6fb7e47f4b4ac817564af9e4b72f0206b21f619b81af9850')
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
