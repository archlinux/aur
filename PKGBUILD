# Maintainer: Albert Graef <aggraef@gmail.com>

pkgname=gnocl-canvas
_pkgname=gnoclCanvas
pkgver=0.9.95
pkgrel=1
pkgdesc="Tcl/GTK+ bindings, GnoclCanvas module"
arch=("i686" "x86_64")
license=('custom')
url="http://www.gnocl.org/"
depends=('gnocl' 'tcl' 'gtk2' 'libglade' 'libgnomecanvas')
makedepends=()
source=("https://launchpad.net/~dr-graef/+archive/gnocl.precise/+files/${pkgname}_${pkgver}.orig.tar.gz"
	"$pkgname-$pkgver.patch")
md5sums=('091225b21c23d112cb721fb2c16dec2f'
         '4e40ef50e5f3df3330bda2278e402ebe')

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
