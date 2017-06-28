# Maintainer: Jonathan Biegert <azrdev@googlemail.com>
# Contributor: Tobias Breitwieser <tobias@breitwieser.biz>
# Contributor: Stefan Betz <info@stefan-betz.net>

# Version control of PKGBUILD: https://github.com/azrdev/peervpn-archlinux/
pkgname=peervpn
pkgver=0.044
_pkgver=${pkgver//./-}
pkgrel=3
pkgdesc="An open source peer-to-peer VPN"
url="http://www.peervpn.net"
arch=('i686' 'x86_64' 'armv5tel' 'armv6l' 'armv7h' 'aarch64')
license=('GPL3')
depends=('openssl-1.0')
backup=('etc/peervpn/peervpn.conf')
source=("http://www.peervpn.net/files/peervpn-${_pkgver}.tar.gz"
        'peervpn@.service'
        'openssl-1.0.patch')

prepare() {
  cd "$pkgname-${_pkgver}"
  patch -N -p1 -i ../openssl-1.0.patch
}

build() {
  cd "$pkgname-${_pkgver}"
  ln -s ../peervpn@.service .
  unset LDFLAGS
  make
}

package() {
  cd "$pkgname-${_pkgver}"
  install -Dm0600 peervpn.conf "$pkgdir/etc/peervpn/peervpn.conf"
  install -Dm0775 peervpn "$pkgdir/usr/bin/peervpn"
  install -Dm0644 peervpn@.service "$pkgdir/usr/lib/systemd/system/peervpn@.service"
}

sha1sums=('91b237943370aec2cadcc74d4c725e8f19aca15a'
          SKIP
	  SKIP)
