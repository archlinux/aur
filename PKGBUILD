# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=buildbox-casd
pkgver=0.0.11.r4.gb86e76f
pkgrel=1
pkgdesc="Local cache and proxy for remote CAS servers"
arch=(x86_64)
url="https://buildgrid.build"
license=('Apache')
depends=('buildbox-common')
makedepends=('cmake' 'git')
_commit=b86e76fd09eda010f3c6121221519ad4b196386a # 0.0.11 + check fix
source=("git+https://gitlab.com/BuildGrid/buildbox/buildbox-casd#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p build
  cd build
  cmake ../$pkgname             \
    -DCMAKE_BUILD_TYPE=Release  \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

# tests failing for 0.0.11
check() {
  cd build
  make -k test
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
