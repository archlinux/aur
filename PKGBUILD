# Maintainer: Thor77 <thor77 at thor77 dot org>
# Contributor: Sebastian Krebs <sebastian[at]krebs[dot]one>

pkgname=telegraf-bin
pkgver=1.31.2
pkgrel=1
pkgdesc="An open source agent for collecting metrics and data on the system; Binary release"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/influxdata/telegraf"
license=('MIT')
conflicts=('telegraf')
backup=('etc/telegraf/telegraf.conf')
install=telegraf.install

source_i686=("https://dl.influxdata.com/telegraf/releases/telegraf-${pkgver}_linux_i386.tar.gz")
source_x86_64=("https://dl.influxdata.com/telegraf/releases/telegraf-${pkgver}_linux_amd64.tar.gz")
source_armv6h=("https://dl.influxdata.com/telegraf/releases/telegraf-${pkgver}_linux_armhf.tar.gz")
source_armv7h=("https://dl.influxdata.com/telegraf/releases/telegraf-${pkgver}_linux_armhf.tar.gz")
source_aarch64=("https://dl.influxdata.com/telegraf/releases/telegraf-${pkgver}_linux_arm64.tar.gz")
source=('telegraf.sysusers' 'telegraf.tmpfiles' 'LICENSE')

sha256sums=('31c038721ff674519a506418b0d70045e2c51115a78a5939743886c44ef5e1bb'
            '36b309e79422ddbaf6067f814c8bd69bd842cc662c3c9dbbf507ee5716282779'
            'bece49bfc61abbb9d0b69bebb47955a44617ada83186c95db5651cd40c0a867a')
sha256sums_i686=('8fad1c2979afe9bcbb6c571154c4cb1e7ec7d8f0f1e96f30da102b3bc1d2a3df')
sha256sums_x86_64=('c65c1540b41ee77c6633614c3e2cafe4ecb5c8b1f2d55ca0571be99970ef0f05')
sha256sums_armv6h=('050e6a7e75ca7d3251267bc1c44658d35beaf2d3212fba24d45dad5a1b15381c')
sha256sums_armv7h=('050e6a7e75ca7d3251267bc1c44658d35beaf2d3212fba24d45dad5a1b15381c')
sha256sums_aarch64=('fd2b7d2c1ac7631a0942af53ef59cd625907fc6fa93161841811b5e21fdb875b')

package() {
  cd "$srcdir"
  install -Dm644 telegraf.sysusers "$pkgdir/usr/lib/sysusers.d/telegraf.conf"
  install -Dm644 telegraf.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/telegraf.conf"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/telegraf/LICENSE"

  cd "telegraf-$pkgver"
  install -Dm755 usr/bin/telegraf "$pkgdir/usr/bin/telegraf"
  install -Dm644 usr/lib/telegraf/scripts/telegraf.service "$pkgdir/usr/lib/systemd/system/telegraf.service"
  install -Dm644 etc/telegraf/telegraf.conf "$pkgdir/etc/telegraf/telegraf.conf"
  install -Dm644 etc/logrotate.d/telegraf "$pkgdir/etc/logrotate.d/telegraf"
}
