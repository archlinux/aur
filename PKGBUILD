# Maintainer: SanskritFritz (gmail)
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: Dennis Gosnell <cdep.illabout@gmail.com>

pkgname=libdockapp
pkgver=0.7.3
pkgrel=1
pkgdesc="Library that provides a framework for developing dockapps."
arch=('i686' 'x86_64')
url="http://www.dockapps.net/${pkgname}"
license=('GPL')
options=('!libtool')
depends=(libxpm)
makedepends=(xorg-font-util xorg-mkfontscale fontconfig)
source=("http://www.dockapps.net/download/${pkgname}-${pkgver}.tar.gz")
md5sums=('7b029c2b2542d1974085690427354501')

build() {
  cd $pkgname-$pkgver
  autoreconf -fvi
  ./configure --prefix=/usr/ --without-examples --without-font
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
  ln -s libdockapp/dockapp.h "$pkgdir/usr/include/dockapp.h"
}
