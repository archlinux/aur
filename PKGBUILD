#!/hint/bash -e
# Maintainer: Adrien Smith <adrien at bouldersmiths dot com>
# Contributor: Martin Poljak <martin at poljak dot cz>
# Contributor: Dan Schaper <dschaper at ganymeade dot com>
pkgname=tcllauncher
pkgver=1.8
pkgrel=2
pkgdesc='A launcher for Tcl applications'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://flightaware.github.io/tcllauncher'
license=('custom:Tcl')
depends=('libbsd' 'tcl')
options=('!emptydirs')
changelog="$pkgname.changelog"
source=("$pkgname-$pkgver.tar.gz::https://github.com/flightaware/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('4fa44597f9cab6df82db5436aa21e6894195ff1ccde09150e2961d5fb9cd60de43419eb1a96d6557b90828255b9aa90c0a8d362e1380b93d02a62d6f668f1e90')

build() {
  cd "$pkgname-$pkgver"
  autoconf
  ./configure --disable-rpath
  make
}

package() {
  cd "$pkgname-$pkgver"
  make install DESTDIR="${pkgdir}"
  install -Dm644 license.terms "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
