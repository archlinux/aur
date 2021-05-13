#Contributor: Jake VanderKolk <jakevanderkolk@gmail.com>
#Contributor: Mihai Coman <mihai@m1x.ro>
#Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=fbxkb
pkgver=0.6
pkgrel=4
pkgdesc="Keyboard indicator and switcher"
arch=('i686' 'x86_64')
url="http://fbxkb.sourceforge.net/"
depends=('gtk2' 'libxmu')
depends_x86_64=('gdk-pixbuf-xlib')
license=('GPL')
source=(https://download.sourceforge.net/fbxkb/${pkgname}-${pkgver}.tgz
	fbxkb.patch)
md5sums=('fa768bbb07aac8a4ae590633499cce15'
         '33171c56c308eb68cb5035762fbb8aa0')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -Np1 -i ../fbxkb.patch
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make LDFLAGS="-Wl,-O1,--sort-common,-z,relro,-z,now"
}

package() {
  cd ${pkgname}-${pkgver}
  make PREFIX="${pkgdir}/usr" install
}
