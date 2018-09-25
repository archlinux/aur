# Maintainer: Ethan Rakoff <ethan@ethanrakoff.com
# Contributor: Scott Linder <scott.linder18@gmail.com>
# Contributor: Jorge Araya Navarro <elcorreo@deshackra.com>
# Contributor: Mikhail Burakov <mikhail.burakov@gmail.com>

pkgname=cockatrice-server-git
pkgver=2.6.1
pkgrel=2
pkgdesc='Open-source multiplatform supported program for playing tabletop card games over a network.'
arch=('i686' 'x86_64')
url='https://cockatrice.github.io/'
license=('GPL2')
depends=('protobuf' 'qt5-websockets')
optdepends=('mariadb: database support')
makedepends=('cmake' 'git')
provides=('cockatrice-server')
conflicts=('cockatrice-server')
source=("git+https://github.com/Cockatrice/Cockatrice")
sha256sums=('SKIP')

build() {
  cd "$srcdir/Cockatrice"
  test -d build && rm -rf build
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DWITH_ORACLE=0 -DWITH_CLIENT=0 -DWITH_SERVER=1 ..
  make
}

package() {
  cd "$srcdir/Cockatrice/build"
  make DESTDIR="$pkgdir/" install
}
