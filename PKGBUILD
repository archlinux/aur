# Maintainer: Stephan Windmüller <arch at freewarepoint dot de>

pkgname=osm-gps-map-gtk3
pkgver=1.1.0
pkgrel=2
pkgdesc="GTK+ 3 library for showing OSM tiles"
arch=('i686' 'x86_64' 'armv7h')
url="http://nzjrs.github.com/osm-gps-map/"
license=('GPL2')
source=("https://github.com/nzjrs/osm-gps-map/archive/$pkgver.tar.gz")
depends=('gtk3' 'libsoup') 
makedepends=('gnome-common' 'gtk-doc' 'gobject-introspection')
optdepends=('python2-osmgpsmap: Python bindings')
sha256sums=('027004459f2f29232d4ca0c914f835e6c06b720aef1daa9b470d9d5e1b71159b')
provides=('osm-gps-map')
conflicts=('osm-gps-map')

package() {
  cd $srcdir/osm-gps-map-$pkgver
  ./autogen.sh
  sed -i "s@osm_gps_mapdocdir = \${prefix}/doc/osm-gps-map@osm_gps_mapdocdir = \
    \${prefix}/share/doc/${pkgname}@" Makefile.in
  ./configure --prefix=/usr --docdir=/usr/share/doc/$pkgname --enable-gtk-doc 
  make
  make DESTDIR=$pkgdir install
}
