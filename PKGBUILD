# Maintainer: Stephan Windmüller <arch at freewarepoint dot de>

pkgname=osm-gps-map-gtk3
pkgver=1.0.2
pkgrel=2
pkgdesc="GTK+ 3 library for showing OSM tiles"
arch=('i686' 'x86_64')
url="http://nzjrs.github.com/osm-gps-map/"
license=('GPL2')
source=("https://github.com/nzjrs/osm-gps-map/archive/$pkgver.tar.gz")
depends=('gtk3' 'libsoup') 
makedepends=('gnome-common' 'gtk-doc')
optdepends=('python2-osmgpsmap: Python bindings')
sha256sums=('5cc98624926191a06848ee694884bea830be084cc19f25dbf30a25befec01004')

package() {
  cd $srcdir/osm-gps-map-$pkgver
  ./autogen.sh
  sed -i "s@osm_gps_mapdocdir = \${prefix}/doc/osm-gps-map@osm_gps_mapdocdir = \
    \${prefix}/share/doc/${pkgname}@" Makefile.in
  ./configure --prefix=/usr --docdir=/usr/share/doc/$pkgname --enable-gtk-doc 
  make
  make DESTDIR=$pkgdir install
}
