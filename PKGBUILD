# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=buildbox-casd
pkgver=0.0.44.r0.g0ace1cb
pkgrel=1
pkgdesc="Local cache and proxy for remote CAS servers"
arch=(x86_64)
url="https://buildgrid.build"
license=('Apache')
depends=('buildbox-common' 'util-linux-libs')
makedepends=('cmake' 'git')
_commit=0ace1cbe8489f7291f9db67d9945ca4258118e4c # release 0.0.44
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
