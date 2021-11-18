# Contributor: Pavel Borzenkov <pavel.borzenkov@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>

pkgname=tclxml
pkgver=3.3.1
pkgrel=1
pkgdesc="XML support for the Tcl scripting language"
url="https://github.com/flightaware/TclXML"
arch=('i686' 'x86_64')
license=('custom:BSD')
depends=('libxslt' 'bash')
optdepends=('tcl: technically not needed, but you want it if you want this package'
   'tcllib: technically not needed, but you want it if you want this package')
source=("https://github.com/flightaware/TclXML/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('fb8106c41efcb5053389007851d2a237')

build() {
  cd $srcdir/TclXML-$pkgver
  ./configure --prefix=/usr
  make
}
package() {
  cd $srcdir/TclXML-$pkgver
  make DESTDIR=$pkgdir install
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -d $pkgdir/usr/share/doc/$pkgname
  cp -r doc/* $pkgdir/usr/share/doc/$pkgname
  rmdir $pkgdir/usr/bin
}
