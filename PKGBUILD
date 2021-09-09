# Maintainer: pingplug < aur at pingplug dot me >

_commit=4b81d4099d8c23d710d46956a9423cd5b43eb9e2
_pkgname=SOEM

pkgname=soem
pkgver=1.4.0.r51.g4b81d40
pkgrel=1
pkgdesc="Simple Open EtherCAT Master Library"
arch=('x86_64')
url="https://openethercatsociety.github.io/doc/soem"
license=('GPL2')
makedepends=('cmake' 'git')
depends=()
source=("git+https://github.com/OpenEtherCATsociety/SOEM.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p build && cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_SBINDIR=bin \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=on
  make
}

package() {
  cd "${srcdir}/${_pkgname}/build"
  DESTDIR="${pkgdir}" make install
}
