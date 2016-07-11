# Maintainer: James An <james@jamesan.ca>
# Contributor: Michael Fellinger <m.fellinger@gmail.com>

_pkgname=crypt
pkgname="libtom$_pkgname"
pkgver=1.17
pkgrel=10
pkgdesc="A fairly comprehensive, modular and portable cryptographic toolkit"
url="http://libtom.net/?page=features&newsitems=5&whatfile=$_pkgname"
license=('custom:Public Domain' 'custom:WTFPL')
arch=('i686' 'x86_64')
depends=('gmp')
makedepends=('libtommath')
options=('!emptydirs')
source=("https://github.com/libtom/$pkgname/releases/download/$pkgver/$_pkgname-$pkgver.tar.bz2")
md5sums=('cea7e5347979909f458fe7ebb5a44f85')

package() {
  cd ${srcdir}/$pkgname-$pkgver
  make NODOCS=1 DESTDIR="$pkgdir" install
  make NODOCS=1 DESTDIR="$pkgdir" clean
  CFLAGS="-DLTM_DESC -DGMP_DESC" \
  EXTRALIBS="-ltommath -lgmp" \
  make -f makefile.shared NODOCS=1 DESTDIR="$pkgdir" install
}
