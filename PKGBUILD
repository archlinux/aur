# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Barry Smith < brrtsm gmail c om>
# Contributor: Steffen Weber <-boenki-gmx-de->
# Contributor: Brian Bidulock <bidulock@openss7.org>

pkgname=librfm5
pkgver=5.3.16.3
pkgrel=2
pkgdesc="Rodent file manager library"
arch=('i686' 'x86_64')
url="http://xffm.org/"
license=('GPL3')
makedepends=('intltool')
depends=('libtubo0' 'libdbh2' 'libzip' 'gtk3' 'librsvg' 'file')
source=(https://downloads.sourceforge.net/project/xffm/$pkgver/$pkgname-$pkgver.tar.bz2)
sha512sums=('e3d00b0337c9368bbe939bcb2d7f6b1c3f3b6b5a810074c5d6bc7afccd938c5284075231a0326b5be2b93436bee346871fb47ee30c130e6ce00756148d214000')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  # Fight unused direct deps
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' libtool
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="${pkgdir}" install
}
