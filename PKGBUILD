# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=shtk
pkgver=1.7
pkgrel=1
pkgdesc="Application toolkit for programmers writing POSIX-compliant shell scripts"
arch=('any')
makedepends=('autoconf' 'automake' 'make')
url="https://github.com/jmmv/shtk"
license=('BSD')
source=($pkgname-$pkgver.tar.gz::https://github.com/jmmv/$pkgname/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('9386b7dbf1a28361eaf56dd1712385abdbdf3a02f03e17ccbf5579bf22695e27')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Building...'
  #autoreconf -i -s
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/shtk \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/shtk \
    --localstatedir=/var/lib/shtk
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/shtk"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install
  mv "$pkgdir/usr/tests" "$pkgdir/usr/share/shtk"
}
