# Maintainer: Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>

pkgname=hildon-thumbnail
pkgver=3.1.3
pkgrel=1
pkgdesc="The Hildon Thumbnailer daemon"
url="https://github.com/maemo-leste/$pkgname"
arch=(any)
license=(GPL)
depends=(libhildon) 
makedepends=(libosso sqlite libpng libexif libjpeg-turbo gstreamer
             autoconf automake libtool)
checkdepends=()
provides=($_pkgname)
conflicts=($_pkgname)
groups=(gnome)
source=("git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  cd $pkgname
  ./autogen.sh 
  ./configure --prefix=/usr \
              --sysconfdir=/etc
  make -C daemon/ libshared.la -j1
  make -j1 
 }

package() {
  cd $pkgname
  make DESTDIR=$pkgdir -j1 install
  libtool --finish /usr/lib
 
}
