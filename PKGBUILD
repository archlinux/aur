# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Hyperair <hyperair@gmail.com>
pkgname=tsclient
pkgver=0.150
pkgrel=3
pkgdesc="Terminal Server Client [tsclient] is a GTK2 frontend for rdesktop and other remote desktop tools."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/tsclient"
license=('GPL')
depends=('rdesktop' 'libgnomeui' 'gnome-panel2')
optdepends=('tigervnc: for VNC support'
	    'xorg-server-xnest: for X via Xnest support')
makedepends=('perlxml' 'sharutils')
changelog="ChangeLog"
source=(http://downloads.sf.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('1dc95fbdbcf4344d05114e1f43bf32ea')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure \
	CFLAGS="$CFLAGS `pkg-config --cflags libgnomeui-2.0`" \
	LDFLAGS="`pkg-config --libs libgnomeui-2.0`" \
	--prefix=/usr --libexecdir=/usr/lib
  make  CFLAGS="$CFLAGS `pkg-config --cflags libgnomeui-2.0`" \
	LDFLAGS="`pkg-config --libs libgnomeui-2.0`"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
