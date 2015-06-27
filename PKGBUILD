# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=libnjb
pkgver=2.2.7
pkgrel=3
pkgdesc="Library for communicating with various portable MP3 players"
arch=('i686' 'x86_64')
url="http://libnjb.sourceforge.net/"
license=('BSD')
depends=('libusb-compat' 'ncurses' 'zlib')
makedepends=('doxygen')
source=(http://downloads.sourceforge.net/sourceforge/libnjb/$pkgname-$pkgver.tar.gz
        45-libnjb.rules)
md5sums=('73f25f3297abe316dd0abec921781d50' 
         '17b83c2469e083bf1f273174d91dfa13')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --disable-hotplugging
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -D -m644 "$srcdir/45-libnjb.rules" "$pkgdir/usr/lib/udev/rules.d/45-libnjb.rules"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
