#
# Maintainer: oi_wtf <brainpower at mailbox dot org>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: David Rosenstrauch <darose@darose.net>

pkgname=ddclient-ipv6
_pkgname=ddclient
pkgver=3.9.0
pkgrel=1
pkgdesc="Update dynamic DNS entries for accounts on many dynamic DNS services"
arch=('any')
url="http://ddclient.sourceforge.net"
license=('GPL2')
depends=('perl-io-socket-ssl' 'perl-digest-sha1' 'net-tools' 'perl-data-validate-ip')
provides=('ddclient')
conflicts=('ddclient')
backup=('etc/ddclient/ddclient.conf')
source=("ddclient-${pkgver}.tar.gz::https://github.com/ddclient/ddclient/archive/v${pkgver}.tar.gz"
        $_pkgname.service)
md5sums=('20f5cac911d6671799eac6e1a627868c'
         '1bcd3e75309e658931532adef2a0608a')

package() {
  cd "$srcdir"/$_pkgname-$pkgver

  install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
  install -Dm600 sample-etc_$_pkgname.conf "$pkgdir"/etc/$_pkgname/$_pkgname.conf
  install -d "$pkgdir"/var/cache/$_pkgname
  install -Dm644 "$srcdir"/$_pkgname.service "$pkgdir"/usr/lib/systemd/system/$_pkgname.service

  install -Dm644 README.cisco "$pkgdir"/usr/share/doc/$_pkgname/README.cisco
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$_pkgname/README.md
  install -Dm644 README.ssl "$pkgdir"/usr/share/doc/$_pkgname/README.ssl
  install -Dm644 sample-etc_cron.d_$_pkgname "$pkgdir"/usr/share/doc/$_pkgname/sample-etc_cron.d_$_pkgname
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
  install -Dm644 COPYRIGHT "$pkgdir"/usr/share/licenses/$pkgname/COPYRIGHT
}
