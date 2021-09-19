# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Maintainer: Joost Molenaar <jjm@j0057.nl>

pkgname=mrouted
pkgver=4.3
pkgrel=1
pkgdesc="An implementation of the DVMRP multicast routing protocol. It turns a UNIX workstation into a DVMRP multicast router with tunnel support, in order to cross non-multicast-aware routers."
arch=('i686' 'x86_64')
url="https://github.com/troglobit/mrouted"
license=('BSD')
depends=('glibc')
source=("https://github.com/troglobit/mrouted/releases/download/${pkgver}/mrouted-${pkgver}.tar.gz")

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --runstatedir=/run --with-systemd=/usr/lib/systemd/system
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR=$pkgdir install

  # rename mtrace to mrtrace due to conflict with glibc
  mv "$pkgdir/usr/bin/mtrace" "$pkgdir/usr/bin/mrtrace"
  mv "$pkgdir/usr/share/man/man8/mtrace.8" "$pkgdir/usr/share/man/man8/mrtrace.8"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('20daba275e2dc55fbfde6bc4f2f4a3a8467d7fbebce27d645a3e877b41fc6db1')

# vim: se sw=2 et ts=2:
