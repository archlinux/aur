# Maintainer: Jonathan Biegert <azrdev@googlemail.com>
# Contributor: Tobias Breitwieser <tobias@breitwieser.biz>
# Contributor: Stefan Betz <info@stefan-betz.net>

pkgname=peervpn
pkgver=0.036
pkgrel=1
pkgdesc="An open source peer-to-peer VPN"
url="http://www.peervpn.net"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('openssl')
backup=('etc/peervpn/peervpn.conf')
source=("http://www.peervpn.net/files/peervpn-${pkgver//./-}.tar.gz"
        'peervpn@.service')
sha1sums=('193d0c0f18c3039747bdf203021dc62f30c9e03e'
          '6fbbebb760d510b11fd8142712c4d6985cb0d6ca')

build() {
  cd $srcdir/$pkgname-${pkgver/./-}
  ln -s ../../peervpn@.service .
  unset LDFLAGS
  make
}

package() {
  cd $srcdir/$pkgname-${pkgver/./-}
  install -Dm0600 peervpn.conf $pkgdir/etc/peervpn/peervpn.conf
  install -Dm0775 peervpn $pkgdir/usr/bin/peervpn
  install -Dm0644 peervpn@.service $pkgdir/usr/lib/systemd/system/peervpn@.service
}
