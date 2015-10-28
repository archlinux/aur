# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=shtk
pkgver=1.6
pkgrel=1
pkgdesc="Collection of reusable modules written in sh that provide common functionality to simplify the implementation of complex shell scripts"
arch=('any')
makedepends=('autoconf' 'automake' 'make')
url="https://github.com/jmmv/shtk"
license=('BSD')
source=($pkgname-$pkgver.tar.gz::https://github.com/jmmv/$pkgname/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('2a3892ce6c624ae5d7a1d96b014fcff0ee6920a3f76ac0ab0b7d4ff16c7a7d0f')

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
  install -Dm 644 COPYING "$pkgdir/usr/share/licenses/shtk/COPYING"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install
  mv "$pkgdir/usr/tests" "$pkgdir/usr/share/shtk"
}
