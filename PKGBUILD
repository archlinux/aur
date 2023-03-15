# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=ngircd
pkgver=26.1
pkgrel=3
pkgdesc="Next Generation IRC Daemon"
arch=('x86_64')
backup=(etc/ngircd.conf)
url="https://ngircd.barton.de/"
license=('GPL')
depends=('openssl' 'libident' 'zlib')
source=("https://ngircd.barton.de/pub/ngircd/ngircd-$pkgver.tar.gz"{,.sig}
        ngircd.service)
sha256sums=('41e1b1c6326c667a6a07799c34175b5406e78ec3b19b4b780046c8d3f532706e'
            'SKIP'
            'f02e30f6864ba1130bcc85bedc44ad782687f572c06f10e0501b0ddcf532b404')
validpgpkeys=('F5B9F52ED90920D2520376A2C24A0F637E364856') # Alexander Barton <alex@barton.de>

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr \
  	--sysconfdir=/etc \
  	--sbindir=/usr/bin \
  	--mandir=/usr/share/man \
  	--with-ident \
  	--with-openssl \
  	--enable-ipv6
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  install -Dm644 ../ngircd.service "$pkgdir/usr/lib/systemd/system/ngircd.service"
}

# vim:set ts=2 sw=2 et:
