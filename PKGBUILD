# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=mailcrypt
pkgver=3.5.9
pkgrel=5
pkgdesc="Emacs interface to PGP and GnuPG"
arch=('any')
url="http://mailcrypt.sourceforge.net/"
license=('GPL')
depends=('emacs')
makedepends=('texlive-plainextra')
source=(http://downloads.sourceforge.net/sourceforge/mailcrypt/mailcrypt-$pkgver.tar.gz)
md5sums=('18c0dea5dde0fc73168f4815df0d9db0')
install=$pkgname.install

build() {
  cd "$srcdir/$pkgname-$pkgver"
  autoreconf
  ./configure --prefix=/usr --infodir=/usr/share/info 
  make all info
  texi2pdf $pkgname.texi
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -d "$pkgdir"/usr/share/info 
  make lispdir="$pkgdir"/usr/share/emacs/site-lisp \
       infodir="$pkgdir"/usr/share/info install
  for _i in $pkgname.pdf ANNOUNCE COPYING ChangeLog ChangeLog.1 \
			 INSTALL LCD-entry
  do
    install -Dm644 ${_i} $pkgdir/usr/share/doc/$pkgname/${_i}
  done
}
