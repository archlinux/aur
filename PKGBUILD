pkgname=wmmemload
pkgver=0.1.6
pkgrel=8
pkgdesc="WindowMaker dockapp to monitor memory and swap usage."
arch=('i686' 'x86_64')
depends=('libxpm')
license=('GPL')
source=("http://archive.ubuntu.com/ubuntu/pool/universe/w/$pkgname/${pkgname}_${pkgver}.orig.tar.gz")
md5sums=('0ca9bda2fcdccedfb5045b0017d9f60e')
url=("http://packages.ubuntu.com/trusty/wmmemload")

prepare() {
  cd ${pkgname}-${pkgver}
  autoreconf -iv
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
  install -d "$pkgdir/usr/bin"
  install -m755 "$srcdir/$pkgname-$pkgver/src/wmmemload" "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/doc/wmmemload"
  install -m644 "$srcdir/$pkgname-$pkgver/AUTHORS" "$pkgdir/usr/share/doc/wmmemload"
  install -m644 "$srcdir/$pkgname-$pkgver/COPYING" "$pkgdir/usr/share/doc/wmmemload"
  install -m644 "$srcdir/$pkgname-$pkgver/README" "$pkgdir/usr/share/doc/wmmemload"
  install -m644 "$srcdir/$pkgname-$pkgver/THANKS" "$pkgdir/usr/share/doc/wmmemload"
}
