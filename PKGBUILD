# Maintainer: Nicolas Stalder <n+archlinux@stalder.io>
pkgname=nextdns-bin
pkgver="1.36.0"
pkgrel=2
pkgdesc="NextDNS CLI client (DoH Proxy)"
url="https://github.com/nextdns/nextdns"
arch=(x86_64)
license=(MIT)
depends=()
provides=(nextdns)
conflicts=(nextdns)
backup=(etc/nextdns.conf)

source=(
  https://github.com/nextdns/nextdns/releases/download/v${pkgver}/nextdns_${pkgver}_linux_amd64.tar.gz
  # seems to correspond to current defaults (`sudo nextdns config edit` on empty /etc/nextdns.conf)
  # - set a value for key config
  # - consider changing value of keys listen and report-client-info
  # - setting setup-router to true makes nextdns disregard listen key
  nextdns.conf
  nextdns.service
)
# add dummy entries for `make generate-checksums` to create SHA256 instead of MD5 check sums
sha256sums=(
  2e67762f2b08c068ab8f59b458734a673d0b37e3a49aac5a9d151d72d2a8ae72
  SKIP
  SKIP
)

package() {
  install -Dm 755 nextdns ${pkgdir}/usr/bin/nextdns
  install -Dm 644 $srcdir/nextdns.conf "$pkgdir/etc/nextdns.conf"
  install -Dm 644 $srcdir/nextdns.service "$pkgdir/usr/lib/systemd/system/nextdns.service"
  install -Dm 644 $srcdir/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
