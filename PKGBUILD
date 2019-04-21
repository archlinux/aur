# Maintainer: Adrien Smith <adrien at bouldersmiths dot com>
# Contributor: Martin Poljak <martin at poljak dot cz>
# Contributor: Dan Schaper <dschaper at ganymeade dot com>
pkgname=tcllauncher
pkgver=1.8
pkgrel=2
pkgdesc="A launcher for Tcl applications."
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://flightaware.github.io/tcllauncher'
license=('BSD')
depends=('libbsd' 'tcl')
changelog="$pkgname.changelog"
source=("$pkgname-$pkgver.tar.gz::https://github.com/flightaware/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('f2afbf74e11a40501373099684766731dd59dfc2b9c85ba04892e6cdb2435f72')

prepare() {
  cd $pkgname-$pkgver
  autoconf
  ./configure
}

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make install DESTDIR="${pkgdir}"
  install -Dm644 license.terms "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
