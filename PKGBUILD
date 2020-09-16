# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=buildbox-casd
pkgver=0.0.19.r0.gc8d0ea4
pkgrel=1
pkgdesc="Local cache and proxy for remote CAS servers"
arch=(x86_64)
url="https://buildgrid.build"
license=('Apache')
depends=('buildbox-common')
makedepends=('cmake' 'git')
_commit=c8d0ea46347d04855c9731e8741b423b31a8aef3 # release 0.0.19
source=("git+https://gitlab.com/BuildGrid/buildbox/buildbox-casd#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p build
  cd build
  cmake ../$pkgname             \
    -DCMAKE_BUILD_TYPE=Release  \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

check() {
  cd build
  make -k test
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
