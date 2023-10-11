# Maintainer: Sung Mingi <FiestaLake@protonmail.com>
# Contributor: Nicolas Stalder <n+archlinux@stalder.io>

pkgname=nextdns-bin
pkgver=1.41.0
pkgrel=1
pkgdesc="NextDNS CLI client (DoH Proxy)"
url="https://github.com/nextdns/nextdns"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
license=(MIT)
depends=()
provides=(nextdns)
conflicts=(nextdns)
backup=(etc/nextdns.conf)
source=(nextdns.service)
source_x86_64=(https://github.com/nextdns/nextdns/releases/download/v${pkgver}/nextdns_${pkgver}_linux_amd64.tar.gz)
source_i686=(https://github.com/nextdns/nextdns/releases/download/v${pkgver}/nextdns_${pkgver}_linux_386.tar.gz)
source_aarch64=(https://github.com/nextdns/nextdns/releases/download/v${pkgver}/nextdns_${pkgver}_linux_arm64.tar.gz)
source_armv7h=(https://github.com/nextdns/nextdns/releases/download/v${pkgver}/nextdns_${pkgver}_linux_armv7.tar.gz)
sha256sums=('00b0c930275df825475b0d86062f7488131f1b2b5e16e5ec6f9983e53138505b')
sha256sums_x86_64=('239469a8a27a5b114f0d3f9bfc61030080e3ed2db2ad859db0c10d4b4052aabc')
sha256sums_i686=('02a7bc41c23ba108764aed03cd20711ea2726420da36ed14afc1b64952313490')
sha256sums_aarch64=('7905397170f13e23584ad22212adbef924615ff23453ca8df3ca57c93fb9b070')
sha256sums_armv7h=('ff16fc1de993b27c7e3ec7d91c44bd0b9812f9097efbb2ae4dee8a2ce05c8f82')

build() {
  cd $srcdir
  # post-install:
  # - set a value for key config
  # - consider changing value of keys listen and report-client-info
  # - NB: setup-router overrides listen
  ./nextdns config list | sort > nextdns.conf
}

package() {
  install -Dm 755 nextdns ${pkgdir}/usr/bin/nextdns
  install -Dm 644 $srcdir/nextdns.conf "$pkgdir/etc/nextdns.conf"
  install -Dm 644 $srcdir/nextdns.service "$pkgdir/usr/lib/systemd/system/nextdns.service"
  install -Dm 644 $srcdir/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
