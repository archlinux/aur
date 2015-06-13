# Maintainer: Albert Graef <aggraef@gmail.com>

pkgname=gnocl-gconf
_pkgname=gnoclGconf
pkgver=0.9.95
pkgrel=1
pkgdesc="Tcl/GTK+ bindings, GnoclGconf module"
arch=("i686" "x86_64")
license=('custom')
url="http://www.gnocl.org/"
depends=('gnocl' 'tcl' 'gtk2' 'libglade' 'libgnomeui')
makedepends=()
source=("https://launchpad.net/~dr-graef/+archive/gnocl.precise/+files/${pkgname}_${pkgver}.orig.tar.gz"
	"$pkgname-$pkgver.patch")
md5sums=('67e59d0cf87b537debfca38d83e27dad'
         '436a48474e9f28abf403c6659744cd99')

build() {
  cd $srcdir/$_pkgname-$pkgver
  patch -p1 < ../$pkgname-$pkgver.patch
  cd src
  chmod 0644 pkgIndex.tcl
  make
}

package() {
  cd $srcdir/$_pkgname-$pkgver/src
  make DESTDIR=$pkgdir install
  install -D -m644 ../license.terms "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
