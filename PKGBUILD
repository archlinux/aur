# Maintainer: zlowly <zlowly@gmail.com>
pkgname=smartdns
pkgver=1.2019.11.02
pkgrel=2
pkgdesc="Local DNS server that accepts DNS query requests from local clients, obtains DNS query results from multiple upstream DNS servers, and returns the fastest access results to clients."
arch=("x86_64")
url="https://github.com/pymumu/smartdns"
license=("GPL3")
depends=('openssl-1.0')
source=("https://github.com/pymumu/smartdns/releases/download/release27/smartdns.$pkgver-1102.$CARCH-all.tar.gz" "$pkgname.patch")
backup=("etc/smartdns/smartdns.conf")
md5sums=('511985eb9f8bea6b0f1b9fd1e19b6934'
         '2481e2bdb5bf5c140107fef66f13151f')
prepare() {
  patch -p1 "$srcdir/$pkgname/systemd/smartdns.service" < "$pkgname.patch"
}
package() {
  cd $pkgname
  install -Dm755 src/smartdns "$pkgdir/usr/bin/smartdns"
  install -Dm644 etc/smartdns/smartdns.conf "$pkgdir/etc/smartdns/smartdns.conf"
  install -Dm644 etc/default/smartdns "$pkgdir/etc/default/smartdns"
  install -Dm644 systemd/smartdns.service "$pkgdir/usr/lib/systemd/system/smartdns.service"
}
