# $Id$
# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jelle van der Waa <jelle at vdwaa dot nl>
# Contributor: Borromini <gotleenucks at g-male dot com>

pkgname=evolution-rss
pkgver=0.3.95
pkgrel=1
pkgdesc="Plugin for Evolution Mail that enables reading of RSS/RDF/ATOM feeds"
arch=('i686' 'x86_64')
url="http://gnome.eu.org/index.php/Evolution_RSS_Reader_Plugin"
license=('GPL')
depends=('evolution')
makedepends=('intltool')
source=(http://gnome.eu.org/$pkgname-$pkgver.tar.xz)
sha256sums=('3fb28eec798b3192ae155b92d17b852264d0e5e35185a4f0c8f526a8d587eb1f')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-schemas-compile

  #https://bugzilla.gnome.org/show_bug.cgi?id=656231
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
