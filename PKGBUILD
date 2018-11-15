# Maintainer:  Quint Guvernator <quint@guvernator.net>
# Contributor: Marq Schneider   <queueRAM@gmail.com>
# Contributor: Alif             <alive4ever at live dot com>

pkgname=btpd
pkgver=0.16
pkgrel=5
pkgdesc="BitTorrent client consisting of a daemon and client commands to control the daemon"
arch=('i686' 'x86_64')
url="http://github.com/btpd/btpd"
license=('custom')
depends=('openssl')
install="$pkgname.install"
source=(https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz \
        $pkgname.service)
sha512sums=('90d7574dec98649fb03973ca802f9ab3f0c43ac42761db2eb22146c985f2a43825ff6a5463d151950a8871ace9d73df2256eb926228ef4321b726c89ec3412f3'
            '35f7abc7341b7a0705f09388460fd73d61afcb863a0cdcf9e5fcc8981aecae3348fb8f592cdb518654a4649563befaea8457853cb0427ce8391fe77109a54c37')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -D -m644 $srcdir/$pkgname.service $pkgdir/usr/lib/systemd/system/$pkgname.service
  install -D -m644 COPYRIGHT $pkgdir/usr/share/licenses/$pkgname/COPYRIGHT
}

# vim:set ts=2 sw=2 et:
