# $Id$
# Maintainer: Jonathan Steel <jsteel@aur.archlinux.org>
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: David Rosenstrauch <darose@darose.net>

pkgname=ddclient
pkgver=3.8.2
pkgrel=2
pkgdesc="Update dynamic DNS entries for accounts on many dynamic DNS services"
arch=('any')
url="http://ddclient.sourceforge.net"
license=('GPL2')
depends=('perl-io-socket-ssl' 'perl-digest-sha1' 'net-tools')
backup=('etc/ddclient/ddclient.conf')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2
        $pkgname.service)
md5sums=('62cd5fe93ced2c794d5f441f9d908841'
         '1bcd3e75309e658931532adef2a0608a')

prepare() {
  cd "$srcdir"/$pkgname-$pkgver

  # Fix FS#40645
  sed -i '2977s/http:/https:/' $pkgname
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

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
