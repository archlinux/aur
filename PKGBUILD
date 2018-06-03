# $Id$
# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: David Rosenstrauch <darose@darose.net>

pkgname=ddclient
pkgver=3.8.3
pkgrel=3

pkgdesc="Update dynamic DNS entries for accounts on many dynamic DNS services"
url="https://ddclient.sourceforge.net"
arch=('any')
license=('GPL2')

backup=('etc/ddclient/ddclient.conf')

depends=('perl-io-socket-ssl' 'perl-digest-sha1' 'net-tools')
optdepends=('perl-json-any: needed for cloudflare module')

source=(https://downloads.sourceforge.net/sourceforge/ddclient/ddclient-$pkgver.tar.bz2
        ddclient.service)

sha512sums=('5f2546687faf82a44c1addf058ef23bd29efba163c7fc1e9660f236aa092e9e51d301320cfdb72b78f2e65860386c30d85773d791f7c298d4ce42ba7dcdb4d2d'
            '8706ece161c4c0a4fb7dfd4972a8bb094e3019077f69cfc511c8a90d11e9c64a217a34e0c49c32ce75c84d579f712facc6a4366c709cd11bd80418e648759f12')

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
