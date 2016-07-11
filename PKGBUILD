# Maintainer: James An <james@jamesan.ca>
# Contributor: Michael Fellinger <m.fellinger@gmail.com>

pkgname='libtomcrypt'
_prjname='libtom'
_pkgname=${pkgname#$_prjname}
pkgver=1.17
pkgrel=12
pkgdesc="A fairly comprehensive, modular and portable cryptographic toolkit"
url="http://$_prjname.net/?page=features&newsitems=5&whatfile=$_pkgname"
license=('custom:Public Domain' 'custom:WTFPL')
arch=('i686' 'x86_64')
depends=('gmp' "${_prjname}math")
source=("https://github.com/$_prjname/$pkgname/releases/download/$pkgver/$_pkgname-$pkgver.tar.bz2")
md5sums=('cea7e5347979909f458fe7ebb5a44f85')

package() {
  cd $pkgname-$pkgver
  make NODOCS=1 DESTDIR="$pkgdir" install
  make NODOCS=1 DESTDIR="$pkgdir" clean
  export CFLAGS="-DLTM_DESC -DGMP_DESC"
  export EXTRALIBS="-ltommath -lgmp"
  make -f makefile.shared NODOCS=1 DESTDIR="$pkgdir" install
}
