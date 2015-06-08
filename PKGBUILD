# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=emacs-jabber
pkgver=0.8.92
pkgrel=1
pkgdesc="Jabber.el: a minimal jabber client for emacs"
url=http://emacs-jabber.sourceforge.net
arch=('any')
license=('GPL')
depends=('emacs' 'gnutls' 'gconf')
install=jabber.el.install
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.xz)
md5sums=('91064079677fbabb7c7540b452b5edcd')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc \
    --libexecdir=/usr/lib/emacs-jabber \
    --with-gconf-schema-file-dir=/usr/share/gconf/schemas
  make
}
package() { 
  cd $srcdir/$pkgname-$pkgver
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=$pkgdir install 
}
