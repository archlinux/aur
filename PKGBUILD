# Maintainer: Thor77 <thor77 at thor77 dot org>
# Contributor: Sebastian Krebs <sebastian[at]krebs[dot]one>

pkgname=telegraf-bin
pkgver=1.35.4
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
sha256sums_i686=('4a2283c0b5b5f519011bf8ffd7dcb97cd91f90c07c215240c06f33953e357715')
sha256sums_x86_64=('a22769949523de3c0fbca5b9cb2264e93e56a8655af802f80fbcbfd1a789cd37')
sha256sums_armv6h=('43a23b121a2786c109ded2752edb47a9feff38d101feecf8ea2838ce9a611c29')
sha256sums_armv7h=('43a23b121a2786c109ded2752edb47a9feff38d101feecf8ea2838ce9a611c29')
sha256sums_aarch64=('b7b5991409ae93f7dd74ed1032047aba63a96fd71a2480219889381d3b65cda2')

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
