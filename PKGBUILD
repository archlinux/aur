# Maintainer: Jonathan Biegert <azrdev@googlemail.com>
# Contributor: Tobias Breitwieser <tobias@breitwieser.biz>
# Contributor: Stefan Betz <info@stefan-betz.net>

pkgname=peervpn
pkgver=0.032
pkgrel=1
pkgdesc="An open source peer-to-peer VPN"
url="http://www.peervpn.net"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('openssl')
backup=('etc/peervpn/peervpn.conf')
source=("http://www.peervpn.net/files/peervpn-${pkgver//./-}.tar.gz"
        'peervpn@.service')
md5sums=('f28f5aea95ac30ca3f6ba01fbf618045'
         'e6f69401a554bb06f4815b6310dd63ba')
sha1sums=('2b3bdb5023475d7c6d49410f3d06d1622b4e04fd'
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
