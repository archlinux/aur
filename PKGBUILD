pkgname=linux-identd
pkgver=1.3
pkgrel=8
pkgdesc="A user identification daemon for Linux"
arch=('x86_64')
url="http://www.fukt.bsnet.se/~per/identd/"
license=('GPL')
source=(http://www.fukt.bsnet.se/~per/identd/linux-identd-1.3.tar.gz
        identd)
md5sums=('c3517f612b351e46951d2ecb0c60b767'
         'd429efff1b7256f8436568abe93a587d')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" SBINDIR=/usr/bin install
  rm -rf "$pkgdir/usr/sbin/in.identd"
  install -Dm644 "$srcdir/identd" "$pkgdir/etc/xinetd.d/identd"
}