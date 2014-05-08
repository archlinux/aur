# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: xaw <xawl.ch@gmail.com>
pkgname=cwm
pkgver=3
pkgrel=4
pkgdesc="A clean and simple window manager for X inspired by evilwm"
arch=('i686' 'x86_64')
url="http://monkey.org/~marius/pages/?page=cwm"
license=('BSD')
depends=('libxext' 'libxft')
changelog=cwm.changelog
source=("http://monkey.org/~marius/cwm/cwm-${pkgver}.tar.gz" 
	"cwm.desktop")
sha256sums=('bd49f9f6e5497e83a9d6332c64addb3470059e6565e1fb386c790e15173cc242'
            '8dc947993fbf294d6f41ba2e0d4234b2321c536a75be1395f6a772cd4aa3f379')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  # fix for linker
  sed -i 's/^LIBS = /LIBS = -lfontconfig /' Makefile.in
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  # desktop file
  install -Dm644 ../cwm.desktop "$pkgdir/usr/share/xsessions/cwm.desktop"

  # license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # documentation
  install -dm755 "$pkgdir/usr/share/doc/$pkgname"
  install -m644 README TODO "$pkgdir/usr/share/doc/$pkgname"
}

