# Maintainer: Mingi Sung <sungmg@saltyming.net>
# Contributor: Nicolas Stalder <n+archlinux@stalder.io>

pkgname=nextdns-bin
pkgver=1.43.1
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
sha256sums_x86_64=('d8cf8f9a1821cfe5af9d6754a880e36703ed5cb223e82fbef9061ad2220a1c7f')
sha256sums_i686=('34c8fe8d55896029bb93dfbf07e476ac4c5c3662c0733cf92836c324bf9cae10')
sha256sums_aarch64=('f1204f7f498cd32b5fe09433fa855d903c76b36736a04168bad48b065c76612d')
sha256sums_armv7h=('4fc52199b50745830776e5592bbff2a7b24eb713c512abddc59b75f4db19f8ed')
b2sums=('cf97472882f3db8e4debbe9aaefd8fddb2c78b1221045b556b486e5adb2448c28ce8c9e49bf54e85858a25760bf6d981c55117975b94039ac48cd24e87e12ec6')
b2sums_x86_64=('d4b41db4ab5378f1275ac5bb2e53f755ea064e1da367dd5840fe5b04e1aaf6cafffcfbb39ad2c14760b4a9184ab947d9cd448872102477a8255fbc509faa7976')
b2sums_i686=('99b9fa6b80edb4f2044de644b4f007a6a95a20eadc148349eec3d81f393d9211d6916906d80791ff64dc0dfd6d39acecd5d3e685af6a1a8bcdafdcf8942d3218')
b2sums_aarch64=('6cbc6844f8beeacaa91a7412fe3fd2c0e27122967488239328e5856aa88c837da47a0282f115ac75f261d1c675f16cfcaacac84bc40929611d9d7e79832948f3')
b2sums_armv7h=('923ce163f7ab8669248fd07ef66fe52afd2f6385c26e8cb0682f284cc2d194e20d2bcd326227785e71c16db8957af33fc3e7d9a96f1a61a3d67c8a8b7473651d')

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
