# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=lp
pkgver=0.1
pkgrel=1
pkgdesc="Listenpipe sits between two applications that are interfaced with pipes, passes through data as-is, and stores what is sent/received in a logfile"
arch=('i686' 'x86_64')
makedepends=('gcc' 'make')
url="http://www.vanheusden.com/listenpipe"
license=('GPL2')
source=(http://www.vanheusden.com/listenpipe/$pkgname-$pkgver.tgz)
sha256sums=('49c3e507c03e7ffd7ab03fbb28783e0d62ed1fadc9f597e103dab63b123bf692')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Fixing Makefile...'
  sed -i 's@cp lp@cp -dpr --no-preserve=ownership lp@' Makefile
  sed -i 's@/usr/local@$(DESTDIR)/usr@' Makefile
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Building...'
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Installing license...'
  install -Dm 644 license.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"

  msg 'Installing...'
  install -dm 755 "$pkgdir/usr/bin"
  make DESTDIR="$pkgdir" install
}
