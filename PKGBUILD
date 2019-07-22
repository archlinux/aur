# Maintainer:
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Elena ``of Valhalla'' Grandi <elena.valhalla@gmail.com>

pkgname=foxtrotgps
pkgver=1.2.2
pkgrel=1
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
source=(https://www.foxtrotgps.org/releases/$pkgname-$pkgver.tar.gz{,.asc})
validpgpkeys=('F0378BFD8385C9968DCBC56CFF7E9E83954BE38A') 
sha256sums=('1773d591ec5cc57a0695b9f9d909aa0b37f6fa577b1eb1753b3eb8a275e1290a'
            'SKIP')

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
