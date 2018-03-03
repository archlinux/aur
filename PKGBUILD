# Maintainer: Thor77 <thor77 at thor77 dot org>
# Contributor: Sebastian Krebs <sebastian[at]krebs[dot]one>

pkgname=telegraf-bin
pkgver=1.5.2
pkgrel=1
pkgdesc="An open source agent for collecting metrics and data on the system; Binary release"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/influxdata/telegraf"
license=('MIT')
conflicts=('telegraf')
backup=('etc/telegraf/telegraf.conf')
install=telegraf.install

source_i686=(telegraf-${pkgver}.tar.gz::"https://dl.influxdata.com/telegraf/releases/telegraf-${pkgver}_linux_i386.tar.gz")
md5sums_i686=('240f447271635c72dc1bc98a590bd107')
source_x86_64=(telegraf-${pkgver}.tar.gz::"https://dl.influxdata.com/telegraf/releases/telegraf-${pkgver}_linux_amd64.tar.gz")
md5sums_x86_64=('eeacef838e856bb0f036750fa43dcd52')
source_armv6h=(telegraf-${pkgver}.tar.gz::"https://dl.influxdata.com/telegraf/releases/telegraf-${pkgver}_linux_armhf.tar.gz")
md5sums_armv6h=('e7918184c2a934140220fe57a78730ae')
source_armv7h=(telegraf-${pkgver}.tar.gz::"https://dl.influxdata.com/telegraf/releases/telegraf-${pkgver}_linux_armhf.tar.gz")
md5sums_armv7h=('338850785ff33a4f7b686289abd25d29')
source=('telegraf.sysusers' 'telegraf.tmpfiles' 'LICENSE')
md5sums=('58cc9edf8fbf07e7d3a0357db78121b1' '9c7a4df3556cab94837c432f5e46cf04' '10a23e7a514f23f0930e1a4254936534')

package() {
  cd $srcdir
  install -Dm644 telegraf.sysusers "$pkgdir/usr/lib/sysusers.d/telegraf.conf"
  install -Dm644 telegraf.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/telegraf.conf"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/telegraf/LICENSE"

  cd telegraf
  install -Dm755 usr/bin/telegraf "$pkgdir/usr/bin/telegraf"
  install -Dm644 usr/lib/telegraf/scripts/telegraf.service "$pkgdir/usr/lib/systemd/system/telegraf.service"
  install -Dm644 etc/telegraf/telegraf.conf "$pkgdir/etc/telegraf/telegraf.conf"
  install -Dm644 etc/logrotate.d/telegraf "$pkgdir/etc/logrotate.d/telegraf"
}
