# Maintainer: Albert Graef <aggraef@gmail.com>

pkgname=gnocl
pkgver=0.9.96+20130131
_pkgver=0.9.96
pkgrel=1
pkgdesc="Tcl/GTK+ bindings"
arch=("i686" "x86_64")
license=('custom')
url="http://www.gnocl.org/"
depends=('tcl' 'gtk2' 'libglade' 'libnotify')
makedepends=()
source=("https://launchpad.net/~dr-graef/+archive/gnocl.precise/+files/${pkgname}_${pkgver}.orig.tar.bz2"
	"$pkgname-$pkgver.patch")
md5sums=('f36639e8cc1236e4e240f406a936ccd3'
         '729c0c47ca108f1adb219605b0c7006b')

build() {
  cd $srcdir/$pkgname-$_pkgver
  patch -p1 < ../$pkgname-$pkgver.patch
  cd src
  chmod 0644 pkgIndex.tcl
  make
}

package() {
  cd $srcdir/$pkgname-$_pkgver/src
  make DESTDIR=$pkgdir install devinstall
  install -D -m644 ../license.terms "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
