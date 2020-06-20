# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Johannes Sjolund <j.sjolund@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gnome-commander
pkgver=1.10.3
pkgrel=1
pkgdesc='Graphical two-pane filemanager for Gnome'
arch=('i686' 'x86_64')
url='http://gcmd.github.io/'
license=('GPL')
depends=('python2' 'libgsf' 'exiv2' 'taglib' 'poppler-glib' 'libunique' )
makedepends=('perl-xml-parser' 'itstool' 'yelp-tools')
source=(https://download.gnome.org/sources/gnome-commander/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('ef130851058d63194f790bfbba27b6be2b6f2906d923ccec847b9cc595193a2e')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr --libdir=/usr/lib --sysconfdir=/etc \
	      --localstatedir=/var --enable-python \
	      --with-help-dir=/usr/share/doc/$pkgname
  make
}

package() {
  cd "$pkgname-$pkgver"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir"  install
 }
