# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=wmbiff
pkgver=0.4.27
arch=('i686' 'x86_64')
pkgrel=4
pkgdesc="WindowMaker dock app that displays the number of read and unread messages in up to five mailboxes."
url="http://wmbiff.sourceforge.net/"
license=("GPL")
depends=('libxpm' 'gnutls')
optdepends=('ruby: to run security.debian.rb')
source=("http://downloads.sourceforge.net/wmbiff/wmbiff-0.4.27.tar.gz"
	"libgnutls-config"
	"gnutls.patch")
md5sums=('50466b6e4a143cf4e55546b34d5792e6'
         'e549721cfa4f39956f1f8c8c612e4e5e'
         '74ec98339fde3534ed5a2761c84e8ea6')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -b -z .orig -i ../gnutls.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure LIBGNUTLS_CONFIG="$srcdir/libgnutls-config" --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
