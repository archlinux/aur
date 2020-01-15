# Maintainer: Mircea Dan Gheorghe <mirceadan@gmail.com>
# Contributor: Mircea Dan Gheorghe <mirceadan@gmail.com>


# inspired from
#https://wiki.archlinux.org/index.php/creating_packages
#https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=tclxml
#https://bbs.archlinux.org/viewtopic.php?id=243517

pkgname=tclsoap
pkgver=1.6.7.2
pkgrel=1
pkgdesc="The package provides a mechanism to bind Tcl command procedures to remote procedure calls using the Simple Object Access Protocol (SOAP) and XML-RPC over HTTP. Both client and server code is provided."
url="http://tclsoap.sourceforge.net"
arch=('any')
license=('MIT')
depends=('tcl' 'tclxml')
optdepends=(
    'tdom: technically not needed, but you want it if you want this package'
    'tcllib: technically not needed, but you want it if you want this package'
)
source=("https://github.com/ByReaL/tclsoap/archive/$pkgver.tar.gz")
md5sums=('a6d89c7490a699e03f4246a3a080c210')

build() {
  cd $srcdir/$pkgname-$pkgver
  bash ./configure --prefix=/usr
  make
}
package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -d $pkgdir/usr/share/doc/$pkgname
  cp -r doc/* $pkgdir/usr/share/doc/$pkgname
}
