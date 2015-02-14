# Maintainer: Jonathan Biegert <azrdev@googlemail.com>
# Contributor: Tobias Breitwieser <tobias@breitwieser.biz>
# Contributor: Stefan Betz <info@stefan-betz.net>

# Version control of PKGBUILD: https://github.com/azrdev/peervpn-archlinux/
pkgname=peervpn
pkgver=0.042
_pkgver=${pkgver//./-}
pkgrel=5
pkgdesc="An open source peer-to-peer VPN"
url="http://www.peervpn.net"
# please report if you find an architecture this does *not* build and run on
arch=('any')
license=('GPL3')
depends=('openssl')
backup=('etc/peervpn/peervpn.conf')
source=("http://www.peervpn.net/files/peervpn-${_pkgver}.tar.gz"
        'peervpn@.service')
sha1sums=('3901ac75caecdf915847b87e259d9f81dad1acba'
          '6fbbebb760d510b11fd8142712c4d6985cb0d6ca')

build() {
  cd $pkgname-${_pkgver}
  ln -s ../peervpn@.service .
  unset LDFLAGS
  make
}

package() {
  cd $pkgname-${_pkgver}
  install -Dm0600 peervpn.conf $pkgdir/etc/peervpn/peervpn.conf
  install -Dm0775 peervpn $pkgdir/usr/bin/peervpn
  install -Dm0644 peervpn@.service $pkgdir/usr/lib/systemd/system/peervpn@.service
}
