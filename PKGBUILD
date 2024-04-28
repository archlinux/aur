# Maintainer: Mingi Sung <sungmg@saltyming.net>
# Contributor: Nicolas Stalder <n+archlinux@stalder.io>

pkgname=nextdns-bin
pkgver=1.43.0
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
sha256sums_x86_64=('c6157f8660221b6ef8622a63e8e673583f2f57727b74163a7b116a2a34fe45e3')
sha256sums_i686=('7ad761ee4efe19603c059085b8b33fc0109af9f05be4e3a2d1e8a75cef3cc50c')
sha256sums_aarch64=('940a7dbfbeac3690b412832703ecbdfb3a15315d84ed650c43cfd16e822caf90')
sha256sums_armv7h=('b5b6b75787db481b53c14185dba59bf1e10d17e79c208b90bc29a2d2d8a75817')
b2sums=('cf97472882f3db8e4debbe9aaefd8fddb2c78b1221045b556b486e5adb2448c28ce8c9e49bf54e85858a25760bf6d981c55117975b94039ac48cd24e87e12ec6')
b2sums_x86_64=('87c676d725dae7432f7983d5008747200fe677ee3d1c98a558c38899e061dd0611a0a1a2aa69797ae2ceddde1d41370e059e76d3d15e9175e91670512f37d77b')
b2sums_i686=('18b9fd679e3312024636d400b0ab69cd2b1ce740f1b903cf605c33225ad5eccd620b934236c24518dc9038c3bcc804a61580d151bd922f0de8ab4f09c9243ade')
b2sums_aarch64=('3ed98f8aca70b011d30eb5b710c6a065805ec8dd61af7632ab838ec0d03e591982d1324db1d15a9c64192d7081aefb074640e1a39fb22769b6270926e3bc843c')
b2sums_armv7h=('8e9eaddec28cba3e8e19d95234aa60b5b010fba801a82173b60092f188e4a779f91b860f9495a54b0dee592d37da27b1288dee2d011787d2035a4cbc6bd9a9ea')

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
