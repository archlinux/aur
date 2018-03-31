# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=zmeventserver-git
_pkgname=${pkgname%%-git}
pkgver=20180331.f6e6a78
pkgrel=1
pkgdesc='A WSS (Secure Web Sockets) based event notification server that broadcasts new events to any authenticated listeners.'
arch=(any)
url='https://github.com/synthead/zmeventserver/tree/support-options-from-cli-and-config-file'
license=(GPL3)
depends=(
  perl-crypt-mysql
  perl-io-socket-ssl
  perl-json
  perl-lwp-protocol-https
  perl-net-websocket-server
  perl-config-inifiles
)
makedepends=(git)
source=(
  'git+https://github.com/synthead/zmeventserver.git#branch=support-options-from-cli-and-config-file'
  zmeventserver.service
)
sha256sums=(
  SKIP
  24a523f42e0022792db99acdfb27c44f9951e25cd7ddcd92b82abbf60fe4d623
)
backup=('etc/zmeventnotification.ini')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git log -1 --format='%cd.%h' --date=short | tr -d -
}

package() {
  install -dm 700 -o 33 "$pkgdir/var/lib/zmeventnotification"

  install -Dm 755 \
    "$srcdir/zmeventserver/zmeventnotification.pl" \
    "$pkgdir/usr/bin/zmeventnotification.pl"

  install -Dm 644 \
    "$srcdir/zmeventserver/zmeventnotification.ini" \
    "$pkgdir/etc/zmeventnotification.ini"

  install -Dm 644 \
    "$srcdir/zmeventserver.service" \
    "$pkgdir/usr/lib/systemd/system/zmeventserver.service"
}
