# Maintainer: Corey Mwamba <contact.me@coreymwamba.co.uk>
# Contributor: Corey Mwamba <contact.me@coreymwamba.co.uk>
pkgname=rtirq
pkgver=20150216
pkgrel=1
pkgdesc="Realtime IRQ thread system tuning."
arch=('any')
url="http://www.rncbc.org/jack/"
license=('GPL')
groups=('multimedia')
depends=('bash')
backup=('etc/conf.d/rtirq' 'usr/lib/systemd/system/rtirq.service')
install=rtirq.install
source=(http://www.rncbc.org/jack/$pkgname-$pkgver.tar.gz)
md5sums=('59e8b012c16b1e879ce8648f537400c5')

package() {
  cd "$srcdir/$pkgname-$pkgver"
sed -e "s|etc/sysconfig/rtirq|etc/conf.d/rtirq|" -i rtirq.sh
sed -e "s|IRQ\.|irq/|" -i rtirq.sh
sed -e "s|etc/init.d|usr/bin|" -i rtirq.service
install -vD rtirq.sh   -m 0755 $pkgdir/usr/bin/rtirq
install -vD rtirq.conf -m 0644 $pkgdir/etc/conf.d/rtirq
install -vD rtirq.service -m 0644 $pkgdir/usr/lib/systemd/system/rtirq.service
}

