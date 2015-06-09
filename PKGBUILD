# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ald
pkgver=0.1.7
pkgrel=1
pkgdesc="Assembly Language Debugger"
arch=('i686')
depends=('gtk2' 'readline')
makedepends=('gcc' 'make')
url="http://ald.sourceforge.net"
license=('GPL')
source=(https://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('673575054a203db13cb01090491c5be30f376ac6d6e4209c8995011ae5cd7c02')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Building...'
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/ald \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/ald \
    --localstatedir=/var/lib/ald \
    --enable-readline \
    --enable-gtk
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Installing...'
  make DESTDIR="$pkgdir" install
}
