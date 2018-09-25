# Maintainer: Ethan Rakoff <ethan@ethanrakoff.com>
# Contributor: Scott Linder <scott.linder18@gmail.com>
# Contributor: Jorge Araya Navarro <elcorreo@deshackra.com>
# Contributor: Mikhail Burakov <mikhail.burakov@gmail.com>

pkgname=cockatrice-server
pkgver=2.6.1
_reldate=2018-07-17
pkgrel=2
pkgdesc='Open-source multiplatform supported program for playing tabletop card games over a network.'
arch=('i686' 'x86_64')
url='https://cockatrice.github.io/'
license=('GPL2')
depends=('protobuf' 'qt5-websockets')
optdepends=('mariadb: database support')
makedepends=('cmake')
provides=('cockatrice-server')
conflicts=('cockatrice-server')
_relname="$_reldate-Release-$pkgver"
source=("https://github.com/Cockatrice/Cockatrice/archive/$_relname.tar.gz")
sha256sums=('3fbd3d51073f983602a78150e5e05b80e410a840a21e40c394f36d4b6f72b123')

build() {
  cd "$srcdir/Cockatrice-$_relname"
  test -d build && rm -rf build
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DWITH_ORACLE=0 -DWITH_CLIENT=0 -DWITH_SERVER=1 ..
  make
}

package() {
  cd "$srcdir/Cockatrice-$_relname/build"
  make DESTDIR="$pkgdir/" install
}
