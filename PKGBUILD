# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=gadmin-bind
pkgver=0.2.8
pkgrel=2
pkgdesc="A GTK+ Application to help administrate BIND"
arch=('i686' 'x86_64')
url="http://dalalven.dtdns.net/linux/gadmintools-webpage/app_pages/gadmin-bind.html"
license=('GPL')
depends=('gtk3' 'bind')
optdepends=('gksu: Graphical SU Support')
source=("http://dalalven.dtdns.net/linux/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}-menu"
	"${pkgname}.desktop"
	)
md5sums=('ae4686c0417ac542b54aaf6d7a76d893'
         '8705c6ad45bdd08022cef2de4cd8bbc7'
         '0fd7b067494e1edef07a9ec5a8a38643')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  NAMED_BINARY=/usr/bin/named SYSLOG_PATH=/var/log/messages ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install sbindir=/usr/bin
  install -m644 -D $srcdir/gadmin-bind.desktop $pkgdir/usr/share/applications/gadmin-bind.desktop
  install -m755 $srcdir/gadmin-bind-menu $pkgdir/usr/bin/gadmin-bind-menu
}
