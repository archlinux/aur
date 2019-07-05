# Maintainer: Denis Vadimov <me @ bloody.pw>

pkgname=php-geos-git
pkgver=1.0.0.r10.g200cc31
pkgrel=1
pkgdesc="PHP bindings for GEOS"
arch=('i686' 'x86_64')
url="http://geos.osgeo.org/"
license=('LGPL2' 'MIT')
makedepends=('php')
depends=('geos')
source=('php-geos::git+https://git.osgeo.org/gitea/geos/php-geos.git')
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/php-geos

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
   cd $srcdir/php-geos/

   ./autogen.sh
   ./configure --prefix=/usr
   make
}

package() {
   cd $srcdir/php-geos/

   make install INSTALL_ROOT="${pkgdir}"

   mkdir -p $pkgdir/etc/php/conf.d/
   echo ';extension=geos.so' > $pkgdir/etc/php/conf.d/geos.ini
}
