# Maintainer: Albert Graef <aggraef@gmail.com>

pkgname=gnocl-builder
pkgver=0.9.96+20130128
_pkgname=gnoclBuilder
_pkgver=0.9.96
pkgrel=1
pkgdesc="Tcl/GTK+ bindings, GnoclBuilder module"
arch=("i686" "x86_64")
license=('custom')
url="http://www.gnocl.org/"
depends=('gnocl' 'tcl' 'gtk2' 'libglade' 'libgnomeui')
makedepends=()
source=("https://launchpad.net/~dr-graef/+archive/gnocl.precise/+files/${pkgname}_${pkgver}.orig.tar.bz2"
	"$pkgname-$pkgver.patch")
md5sums=('d5ae4c3fd45554be4840e0434e544445'
         'a3b9f8373b60c75bf112ff07d47388ce')

build() {
  cd $srcdir/$_pkgname-$_pkgver
  patch -p1 < ../$pkgname-$pkgver.patch
  cd src
  chmod 0644 pkgIndex.tcl
  make
}

package() {
  cd $srcdir/$_pkgname-$_pkgver/src
  make DESTDIR=$pkgdir install
  install -D -m644 ../license.terms "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
