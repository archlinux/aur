# $Id$
# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: David Rosenstrauch <darose@darose.net>

pkgname=ddclient
pkgver=3.8.3
pkgrel=2

pkgdesc="Update dynamic DNS entries for accounts on many dynamic DNS services"
url="https://ddclient.sourceforge.net"
arch=('any')
license=('GPL2')

backup=('etc/ddclient/ddclient.conf')

depends=('perl-io-socket-ssl' 'perl-digest-sha1' 'net-tools')
optdepends=('perl-json-any: needed for cloudflare module')

source=(https://downloads.sourceforge.net/sourceforge/ddclient/ddclient-$pkgver.tar.bz2
        ddclient.service)

sha256sums=('d40e2f1fd3f4bff386d27bbdf4b8645199b1995d27605a886b8c71e44d819591'
            '0f2f66359de844ca2a0c99f0189879ca1c6b5924f8e07e33cc226680540fa62d')

package() {
  cd ddclient-$pkgver

  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm600 sample-etc_$pkgname.conf "$pkgdir"/etc/$pkgname/$pkgname.conf
  install -d "$pkgdir"/var/cache/$pkgname
  install -Dm644 "$srcdir"/$pkgname.service "$pkgdir"/usr/lib/systemd/system/$pkgname.service

  install -Dm644 README.cisco "$pkgdir"/usr/share/doc/$pkgname/README.cisco
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
  install -Dm644 README.ssl "$pkgdir"/usr/share/doc/$pkgname/README.ssl
  install -Dm644 sample-etc_cron.d_$pkgname "$pkgdir"/usr/share/doc/$pkgname/sample-etc_cron.d_$pkgname
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
  install -Dm644 COPYRIGHT "$pkgdir"/usr/share/licenses/$pkgname/COPYRIGHT
}
