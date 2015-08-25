# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: M.Carreira <manuel@carreira.com.pt>

pkgname=buffer
pkgver=1.19
pkgrel=5
pkgdesc="Speed up writing tapes on remote tape drives"
arch=('i686' 'x86_64')
url="http://www.hello-penguin.com/software.htm"
license=('GPL')
source=(http://www.hello-penguin.com/software/$pkgname/$pkgname-$pkgver.tar.gz
        01-debian-patches.all
        02-fedora-patch.all)
md5sums=('35951ffca7e4df9ad7f97092e1f05b75'
         'a7ef774fa16f70129df285c4a571cd53'
         'b16176e87c5f0e1561483c39f20802ef')


prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 <$srcdir/01-debian-patches.all
  patch -p1 <$srcdir/02-fedora-patch.all
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -p -m 755 -D buffer $pkgdir/usr/bin/buffer
  install -p -m 644 -D buffer.man $pkgdir/usr/share/man/man1/buffer.1
}

# vim:set ts=2 sw=2 et:
