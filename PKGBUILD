# Maintainer: Andrey Vihrov <andrey.vihrov at gmail.com>
# Contributor: James An <james@jamesan.ca>
# Contributor: Michael Fellinger <m.fellinger@gmail.com>

pkgname='libtomcrypt'
_prjname='libtom'
_pkgname=${pkgname#$_prjname}
pkgver=1.17
pkgrel=13
pkgdesc="A fairly comprehensive, modular and portable cryptographic toolkit"
url="http://$_prjname.net/?page=features&newsitems=5&whatfile=$_pkgname"
license=('custom:Public Domain' 'custom:WTFPL')
arch=('i686' 'x86_64')
depends=('gmp' "${_prjname}math")
source=("https://github.com/$_prjname/$pkgname/releases/download/$pkgver/$_pkgname-$pkgver.tar.bz2")
md5sums=('cea7e5347979909f458fe7ebb5a44f85')

build() {
  cd "$pkgname-$pkgver"

  export CFLAGS="-DLTM_DESC -DGMP_DESC"
  export EXTRALIBS="-ltommath -lgmp"
  make -f makefile.shared
}

package() {
  cd "$pkgname-$pkgver"

  make -f makefile.shared DESTDIR="$pkgdir" install
}
