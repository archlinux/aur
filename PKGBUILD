# Maintainer:
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Elena ``of Valhalla'' Grandi <elena.valhalla@gmail.com>

pkgname=foxtrotgps
pkgver=1.2.1
pkgrel=3
pkgdesc="Lightweight and fast mapping application"
arch=('x86_64')
url="https://www.foxtrotgps.org/"
license=('GPL')
depends=('curl' 'dconf' 'gpsd' 'libexif' 'libglade' 'sqlite')
makedepends=('intltool')
optdepends=('gpscorrelate: geotag photos'
            'jhead: add photos to database'
            'python: gpx2osm and osb2foxtrot tools'
            'python-beautifulsoup4: georss2foxtrotgps-poi tool'
            'python-feedparser: georss2foxtrotgps-poi tool'
            'python-sqlalchemy: poi2osm tool')
source=(https://www.foxtrotgps.org/releases/$pkgname-$pkgver.tar.gz{,.asc}
        foxtrotgps-gpsd-3.18.patch)
validpgpkeys=('F0378BFD8385C9968DCBC56CFF7E9E83954BE38A') # Joshua Judson Rosen
sha256sums=('3ffbe60dd09890e3228bc71a0337b27e69e26e52225c47bd75968b580b19f489'
            'SKIP'
            '4a517255e6fa9eade1c0abddf4eab2e803f1b31ce848472d9bbfb69d6ab97aca')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 -i ../foxtrotgps-gpsd-3.18.patch # Fix build with gpsd 3.18
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-schemas-compile
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
