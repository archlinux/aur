# Maintainer:  Quint Guvernator <quint@guvernator.net>
# Contributor: Marq Schneider   <queueRAM@gmail.com>

pkgname=btpd
pkgver=0.16
pkgrel=4
pkgdesc="BitTorrent client consisting of a daemon and client commands to control the daemon"
arch=('i686' 'x86_64')
url="http://github.com/btpd/btpd"
license=('custom')
depends=('openssl')
source=(http://cloud.github.com/downloads/$pkgname/$pkgname/$pkgname-$pkgver.tar.gz \
        $pkgname.service)
sha512sums=('719778762a90f62942ae235c4c3fcd92d859d0c7d977e9fb0d7f3149c4c35c649eadc0a648b8a79c547dae8060ff3dcde1afb38081d55d15ae618039acdafb0f'
            '82d5651a3a71e90aef1b3bcfcba2d3580e70220cfa814c2b810d6873b889db2c4fa2b620b96e3821bb510ea88bf0a15ac7d94b29ebd91b627ad651fd5a4cb687')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -D -m644 $srcdir/$pkgname.service $pkgdir/usr/lib/systemd/user/$pkgname.service
  install -D -m644 COPYRIGHT $pkgdir/usr/share/licenses/$pkgname/COPYRIGHT
}

# vim:set ts=2 sw=2 et:
