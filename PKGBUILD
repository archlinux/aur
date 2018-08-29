# $Id$
# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: David Rosenstrauch <darose@darose.net>

pkgname=ddclient
pkgver=3.9.0
pkgrel=2

pkgdesc="Update dynamic DNS entries for accounts on many dynamic DNS services"
url="https://github.com/ddclient/ddclient"
arch=('any')
license=('GPL2')

backup=('etc/ddclient/ddclient.conf')

depends=('perl-io-socket-ssl' 'perl-digest-sha1' 'net-tools' 'perl-data-validate-ip')
optdepends=('smtp-forwarder: email support requires sendmail binary')

source=(https://github.com/ddclient/ddclient/archive/v$pkgver.tar.gz
        ddclient.service)

sha512sums=('ae314c96a37dd90256d6acf62f4a4523b72f540194131e351a032239b00b4520351f6549d3b20a9209fe49ccc6de7ce158ffa8635d341066ea71b789dc667438'
            '8706ece161c4c0a4fb7dfd4972a8bb094e3019077f69cfc511c8a90d11e9c64a217a34e0c49c32ce75c84d579f712facc6a4366c709cd11bd80418e648759f12')

package() {
  cd ddclient-$pkgver

  install -Dm755 ddclient "$pkgdir"/usr/bin/$pkgname
  install -Dm600 sample-etc_ddclient.conf "$pkgdir"/etc/ddclient/ddclient.conf
  install -d "$pkgdir"/var/cache/ddclient
  install -Dm644 "$srcdir"/ddclient.service "$pkgdir"/usr/lib/systemd/system/ddclient.service

  install -Dm644 README.cisco "$pkgdir"/usr/share/doc/ddclient/README.cisco
  install -Dm644 README.md "$pkgdir"/usr/share/doc/ddclient/README.md
  install -Dm644 README.ssl "$pkgdir"/usr/share/doc/ddclient/README.ssl
  install -Dm644 sample-etc_cron.d_ddclient "$pkgdir"/usr/share/doc/ddclient/sample-etc_cron.d_ddclient
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
  install -Dm644 COPYRIGHT "$pkgdir"/usr/share/licenses/$pkgname/COPYRIGHT
}
