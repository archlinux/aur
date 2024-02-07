# Maintainer: Sung Mingi <FiestaLake@protonmail.com>
# Contributor: Nicolas Stalder <n+archlinux@stalder.io>

pkgname=nextdns-bin
pkgver=1.42.0
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
sha256sums_x86_64=('bf846c15a395f848513ff9891ef00dcbbaa7e556ef8084c8de1a9fe69e076c0a')
sha256sums_i686=('aba45f14629403f1e36ea61f5a34ce08047267611af3ba1adaa3adc8da592e21')
sha256sums_aarch64=('ec4cd871c2fafb15d323110415fcc09056c8d39485f4bdbd8b43bb51b91e7bbd')
sha256sums_armv7h=('47b8bc27af22a6796b3e4a499de0272c5baf7d12c54c433158f700a7fa8ebaab')

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
