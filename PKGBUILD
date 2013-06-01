# Maintainer: Jonathan Biegert <azrdev@googlemail.com>
# Contributor: Tobias Breitwieser <tobias@breitwieser.biz>
# Contributor: Stefan Betz <info@stefan-betz.net>

pkgname=peervpn
pkgver=0.033
pkgrel=1
pkgdesc="An open source peer-to-peer VPN"
url="http://www.peervpn.net"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('openssl')
backup=('etc/peervpn/peervpn.conf')
source=("http://www.peervpn.net/files/peervpn-${pkgver//./-}.tar.gz"
        'peervpn@.service')
sha1sums=('a79fc91d08cd0179e89b68d9acfe3a55505fd16a'
          '9b79472b03a472017d0047e3093778bc3f0cae70')

build() {
  cd $srcdir/$pkgname-${pkgver/./-}
  ln -s ../../peervpn@.service .
  unset LDFLAGS
  make
  install -Dm0600 peervpn.conf $pkgdir/etc/peervpn/peervpn.conf
  install -Dm0775 peervpn $pkgdir/usr/sbin/peervpn
  install -Dm0644 peervpn@.service $pkgdir/usr/lib/systemd/system/peervpn@.service
}
