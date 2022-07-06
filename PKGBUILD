# Maintainer: Thor77 <thor77 at thor77 dot org>
# Contributor: Sebastian Krebs <sebastian[at]krebs[dot]one>

pkgname=telegraf-bin
pkgver=1.23.1
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
sha256sums_i686=('1ed5eb125d1169e8fce50e660fdd82743566c7a2989a7684ce92faf7a6a3896f')
sha256sums_x86_64=('b9e485ccd745949e39d1d9d54e7d93b847b5a0614233e582e146d748e0b038e1')
sha256sums_armv6h=('26d55b7efa193aea5e5cbb39722c7ddbe275270da523bebb903c07bc25fac03f')
sha256sums_armv7h=('26d55b7efa193aea5e5cbb39722c7ddbe275270da523bebb903c07bc25fac03f')
sha256sums_aarch64=('12c56270f574b91f0bde4c5be99a64ca7678b8bdafdfacf5ba809563a22a679b')

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
