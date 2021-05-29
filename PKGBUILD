# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Johannes Sjolund <j.sjolund@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gnome-commander
pkgver=1.12.2
pkgrel=1
pkgdesc='Graphical two-pane filemanager for Gnome'
arch=('i686' 'x86_64')
url='http://gcmd.github.io/'
license=('GPL')
depends=('python' 'libgsf' 'exiv2' 'taglib' 'poppler-glib' 'libunique3' 'gnome-vfs' 'gtk2')
makedepends=('perl-xml-parser' 'itstool' 'yelp-tools')
source=(https://download.gnome.org/sources/gnome-commander/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('45dd864494f6b2ade2bded5a3d7c2d780d7ad038742b08c9c4210fe8e715f438')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr --libdir=/usr/lib --sysconfdir=/etc \
	      --localstatedir=/var --with-help-dir=/usr/share/doc/$pkgname
  make
}

package() {
  cd "$pkgname-$pkgver"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir" install
 }
